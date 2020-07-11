package cn.tea.controller;


import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import cn.tea.pojo.Blog;
import cn.tea.pojo.Product;
import cn.tea.pojo.User;
import cn.tea.service.blog.BlogService;
import cn.tea.service.product.ProductService;
import cn.tea.service.user.UserService;
import cn.tea.util.MD5Utils;


@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productService;
	@Autowired
	private BlogService blogService;
	
	/**
	 * 用户注册
	 */
		@RequestMapping(value="/registerUser",method=RequestMethod.POST )
		public String registerUser(
				@RequestParam(value="uname",required=false) String uname, 
				@RequestParam(value="uemail",required=false) String uemail, 
				@RequestParam(value="upassword",required=false) String upassword,
				@RequestParam(value="uphone",required=false) String uphone, 
				@RequestParam(value="uaddress",required=false) String uaddress,
				User user)  {
			boolean findByUemail=userService.findUserByUemail(uemail);
			if(findByUemail) {
				String upasswordByMd5=MD5Utils.MD5(upassword);
				user.setUname(uname);
				user.setUemail(uemail);
				user.setUpassword(upasswordByMd5);
				user.setUphone(uphone);
				user.setUaddress(uaddress);
				boolean isOk=userService.register(user);
				if(isOk) {
					return "login";
				}
			}
			return "register";
		}
		//登录
		@RequestMapping(value="/dologin" ,method=RequestMethod.POST)
		public String login(@RequestParam("uname") String uname,
				@RequestParam("upassword") String upassword,
				@RequestParam("code") String code,
				HttpSession session,Model model) {
			// 判断验证码的值是否与保存在session中的值相同
	        if(!((String)session.getAttribute("yzm")).equals(code)) {
	            return "login";
	        }
	        String upasswordByMd5=MD5Utils.MD5(upassword);
	        User user = userService.login(uname, upasswordByMd5);
	        if(user != null) {
	        	List<Product> product = productService.getProductAll();
	        	List<Blog> blist=blogService.getBlogList();
	            model.addAttribute("list",product);
	        	model.addAttribute("blist", blist);
	            session.setAttribute("loginUser", user);
	            return "index";
	        }
	        return "login";
		}
		// 定义一个获得验证码的请求
	    @RequestMapping(value="/CodeImg",method=RequestMethod.GET)
	    public void getCode(HttpServletRequest req,HttpServletResponse resp) throws IOException {
	   	// 设置响应的格式类型
	        resp.setHeader("Content-Type", "image/jpeg");
	        // 定义图片的宽和高
	        int w = 80;
	        int h = 30;
	        // 声明一个RGB格式的内存中的图片
	        BufferedImage img = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
	        // 创建一个绘制图像的对象
	        Graphics g = img.getGraphics();
	        // 把背景变白色
	        g.setColor(Color.white);
	        g.fillRect(0, 0, w, h);
	        // 设置字体
	        g.setFont(new Font("aa", Font.BOLD, 18));
	        // 产生并draw出4个随机数字
	        Random r = new Random();
	        // 创建一个保存生成四个数的字符串
	        String yzm = "";
	        for (int i = 0; i < 4; i++) {
	            int a = r.nextInt(10);// 生成0~9之间的随机整数
	            int y = 15 + r.nextInt(10);// 产生随机的垂直位置
	            // 产生随机颜色
	            Color c = new Color(r.nextInt(256), r.nextInt(256), r.nextInt(256));
	            g.setColor(c);
	            g.drawString("" + a, i * 15, y);
	            // 把验证码转换为字符串追加到yzm中
	            yzm += a;
	        }
	        // 把yzm放入session
	        req.getSession().setAttribute("yzm", yzm);
	        // 画几条干扰线
	        for (int i = 0; i < 10; i++) {
	            // 产生随机颜色
	            Color c = new Color(r.nextInt(256), r.nextInt(256), r.nextInt(256));
	            g.setColor(c);
	            g.drawLine(r.nextInt(60), r.nextInt(30), r.nextInt(60), r.nextInt(30));
	        }
	        g.dispose();// 类似于IO中的flush(),把图形数据刷到img中
	        // 把内存图片 img 对象保存到一个 jpg 文件
	        ImageIO.write(img, "JPEG", resp.getOutputStream());
	    }
	  //通过uid查询个人信息
		@RequestMapping(value="/findByUid",method = RequestMethod.GET)
		public String findByUid(@RequestParam(name="uid") int uid,
				HttpSession session) {
			List<User> user=userService.findByUid(uid);
			session.setAttribute("ulist", user);
			return "contact";
		}
		//修改个人信息
		@RequestMapping(value="/updateUser")
		public Object updateUser(User user,
			@RequestParam(value="uname",required=false) String uname, 
			@RequestParam(value="uemail",required=false) String uemail, 
			@RequestParam(value="uphone",required=false) String uphone, 
			@RequestParam(value="uaddress",required=false) String uaddress,
			HttpSession session,Model model) {
				Map<String, Integer> map=new HashMap<String,Integer>();
				String headImage=(String) session.getAttribute("headImage");
				//System.out.println(headImage);
				user.setHeadImage(headImage);
				user.setUemail(uemail);
				//System.out.println(uemail);
				user.setUaddress(uaddress);
				user.setUphone(uphone);
				boolean isOK=userService.updateUser(user);
				List<Product> product = productService.getProductAll();
		        List<Blog> blist=blogService.getBlogList();
		        model.addAttribute("list",product);
		        model.addAttribute("blist", blist);
		        session.setAttribute("updateUser", isOK);
		       if(isOK) {
		    		return "login";
		    	}else {
		    	   return "index";
		    }
		}
		
		//修改密码
		@RequestMapping(value="/updatePsw",method = RequestMethod.POST)
		public Object updatePsw(@RequestParam(value="uname",required=false) String uname,
				@RequestParam(value="upassword",required=false) String upassword) {
			 String upasswordByMd5=MD5Utils.MD5(upassword);
			boolean isOk=userService.updatePsw(uname, upasswordByMd5);
			if(isOk) {
				return "login";
			}else {
				return "updatePwd";
			}
		}
	    //退出
	    @RequestMapping("/outLogin")
		public String outLogin(HttpSession session,Model model) {
			session.invalidate();
			/*
			 * List<Product> product = productService.getProductAll(); List<Blog>
			 * blist=blogService.getBlogList(); model.addAttribute("list",product);
			 * model.addAttribute("blist", blist);
			 */
            return "redirect:index";
		}
	  //上传博客图片的请求
	    @RequestMapping(value="/uploadHeadImage")
	    @ResponseBody
	    public Object addBlog(@RequestParam("crowd_file") MultipartFile crowd_file,HttpSession session) {
	    	String  idPicPath=null;
	    	Map<String, Integer> map = new HashMap<String, Integer>();
	        // 定义上传文件的路径
	    	//file.separator 就相当于/,这样写的目的是为了方便系统的迁移
	        String filePath = session.getServletContext().getRealPath("assets"+File.separator+"files"+File.separator+"headImage");
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
	                DataOutputStream dos = new DataOutputStream(new FileOutputStream("F:/uploadFile/"+"/headImage/"+newFileName));
	                int len = -1;
	                while ((len = dis.read()) != -1) {
	                    dos.write(len);
	                }
	                dos.close();
	                dis.close();
	                session.setAttribute("headImage", newFileName);
	                //System.out.println(newFileName);
	            } catch (FileNotFoundException e) {
	                e.printStackTrace();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	        return JSON.toJSONString(map);
	    }
}
