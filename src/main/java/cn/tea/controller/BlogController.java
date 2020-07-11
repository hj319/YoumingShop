package cn.tea.controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.tea.pojo.Blog;
import cn.tea.pojo.BlogCollect;
import cn.tea.pojo.BlogComments;
import cn.tea.pojo.BlogType;
import cn.tea.pojo.ProductCollect;
import cn.tea.pojo.User;
import cn.tea.service.blog.BlogCommentsService;
import cn.tea.service.blog.BlogService;
import cn.tea.service.blog.BlogTypeService;

@Controller

public class BlogController {
	@Autowired
	private BlogService blogService;
	@Autowired 
	private BlogCommentsService blogCommentsService;
	@Autowired
	private BlogTypeService blogTypeService;
	 
	//获得博客信息
		@RequestMapping(value="/getBlogList",method = RequestMethod.GET)
		public Object getBlogList(@RequestParam(name="currpage",defaultValue = "1") int currpage,
				Model model) {
			PageHelper.startPage(currpage,4);
			List<Blog> list=blogService.getBlogList();
			PageInfo pageInfo=new PageInfo(list,4);
			model.addAttribute(pageInfo);
			return "blog";
		}
		//通过bid查找博客评论
	    @RequestMapping(value="/findByBid",method=RequestMethod.GET)
	    public String findByBid(@RequestParam(name="bid") int bid,
	    		HttpSession session,
	    		Model model) {
	    	blogService.updateView(bid);
	    	List<Blog> blog=blogService.findBybid(bid);
	    	List<Blog> blist=blogService.getBlogList();
			List<BlogComments> blogComm=blogCommentsService.getComm(bid);
	    	model.addAttribute("flist",blog);
			model.addAttribute("clist",blogComm); 
			session.setAttribute("blist", blist);
	    	return "blog-single";
	    }
	    //增加博客信息
	    @RequestMapping(value="/saveBlog")
	    @ResponseBody
	    public Object saveBlog(Blog blog,HttpSession session) {
	    	Map<String,Integer> map=new HashMap<String,Integer>();
	    	String blogImage=(String) session.getAttribute("blogImage");
	    	System.out.println(blogImage);
	    	blog.setBimg(blogImage);
	    	session.removeAttribute(blogImage);
	    	int uid=((User)session.getAttribute("loginUser")).getUid();
	    	blog.setUid(uid);
	    	blog.setCreateTime(new Date());
	    	boolean isOk=blogService.addBlog(blog);
	    	if(isOk) {
	    		map.put("result", 1);
	    	}else {
	    		map.put("result", 0);
	    	}
	    	return JSON.toJSONString(map);
	    }
	    
	    //获得博客分类信息，因为需要页面一加载就需要获得数据，所以用ajax
	    @RequestMapping(value="/getTypeList",method = RequestMethod.GET)
	    @ResponseBody
		public Object getTypeList() {
			List<BlogType> list=blogTypeService.getBlogType();
			return JSON.toJSONString(list);
		}
	    //上传博客图片的请求
	    @RequestMapping(value="/uploadFile")
	    @ResponseBody
	    public Object addBlog(@RequestParam("crowd_file") MultipartFile crowd_file,HttpSession session) {
	    	String  idPicPath=null;
	    	Map<String, Integer> map = new HashMap<String, Integer>();
	        // 定义上传文件的路径
	    	//file.separator 就相当于/,这样写的目的是为了方便系统的迁移
	        String filePath = session.getServletContext().getRealPath("assets"+File.separator+"files"+File.separator+"blog-images");
	        System.out.println("filePath:"+filePath);
	        if(!crowd_file.isEmpty()) {
	            // 获得原文件名
	            String oldName = crowd_file.getOriginalFilename();
	            // 对文件名进行一个处理
	            String newFileName = System.currentTimeMillis()+RandomUtils.nextInt(100000,999999)+oldName;
	            // 创建上传文件对象
	            File saveFile = new File(filePath, newFileName);
	            // 判断文件上传对象是否存在，不存在就创建
	            if (!saveFile.exists()) {
	                saveFile.mkdirs();
	            }
	            // 将文件进行上传
	            try {
	            	crowd_file.transferTo(saveFile);
	            	//System.out.println(crowd_file);
	                map.put("result",1);
	            } catch (IllegalStateException e) {
	                e.printStackTrace();
	                map.put("result",0);
	            } catch (IOException e) {
	                e.printStackTrace();
	                map.put("result",0);
	            }
	            
	            // 将文件保存到本地文件夹中D:/uploadFile/
	            try {
	                DataInputStream dis = new DataInputStream(new FileInputStream(saveFile));
	                DataOutputStream dos = new DataOutputStream(new FileOutputStream("F:/uploadFile/"+"/blog/"+newFileName));
	                int len = -1;
	                while ((len = dis.read()) != -1) {
	                    dos.write(len);
	                }
	                dos.close();
	                dis.close();
	                session.setAttribute("blogImage", newFileName);
	                //System.out.println(newFileName);
	            } catch (FileNotFoundException e) {
	                e.printStackTrace();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	        return JSON.toJSONString(map);
	    }
	    
	    
	    //查询是否被收藏
	    @RequestMapping(value = "/getBlogCollect",method = RequestMethod.GET)
	    @ResponseBody
	    public Object getBlogCollect(@RequestParam("bid") int bid,HttpSession session) {
	    	Map<String, Integer> map = new HashMap<String, Integer>();
	    	int uid=((User)session.getAttribute("loginUser")).getUid();
	    	BlogCollect collect=blogService.getCollect(bid,uid);
	            if (collect != null) {
	            	 map.put("res", 1);
	            } else {
	            	 map.put("res", 0);
	            }
	            return JSON.toJSONString(map);
	        }

	    //删除收藏
		@RequestMapping(value = "/delBlogCollect",method = RequestMethod.GET)
		@ResponseBody
		public Object delBlogCollect(@RequestParam("bid") int bid,HttpSession session) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			int uid=((User)session.getAttribute("loginUser")).getUid();
			boolean isOk=blogService.delCollect(bid,uid);
		        if (isOk) {
		        	 map.put("del", 1);
		        } else {
		        	 map.put("del", 0);
		        }
		        return JSON.toJSONString(map);
		    }
		  //增加收藏
			@RequestMapping(value = "/insertBlogCollect",method = RequestMethod.GET)
			@ResponseBody
			public Object insertBlogCollect(@RequestParam("bid") int bid,HttpSession session,BlogCollect collect) {
				Map<String, Integer> map = new HashMap<String, Integer>();
				int uid = ((User)session.getAttribute("loginUser")).getUid();
				collect.setUid(uid);
				collect.setBid(bid);
				boolean isOk=blogService.insertCollect(collect);
			        if (isOk) {
			        	 map.put("ins", 1);
			        } else {
			        	 map.put("ins", 0);
			        }
			        return JSON.toJSONString(map);
			    }
	    
}
