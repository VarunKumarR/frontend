package com.niit.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.LinkedHashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;
import com.niit.model.Category;
import com.niit.model.Product;

@Controller
public class ProductController {
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	ProductDAO productDAO;

	private Object path;
	
	@RequestMapping("/product")
	public String showProductPage(Model m)
	{
		Product product=new Product();
		m.addAttribute(product);
		m.addAttribute("catlist",this.listCategories());
		return "InsertingProduct";
		                                                                                                                                                  
		
	}
	
	@RequestMapping(value="/InsertProduct",method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product")Product product,Model m,@RequestParam("pimage") MultipartFile filedet)
	{
		Product product1=new Product();
		m.addAttribute(product1);
		productDAO.addProduct(product);
		
		//===> Image Uploading
		String imagePath="C:\\Ecart\\EcartFrontend\\src\\main\\webapp\\resources\\images\\";
		imagePath=imagePath+String.valueOf(product.getProductId())+".jpg";
	    File image=new File(imagePath);
		
		if(!filedet.isEmpty())
		{

			try {
				byte[] fileBuffer=filedet.getBytes();	
				FileOutputStream fos=new FileOutputStream(image);
				BufferedOutputStream bs=new BufferedOutputStream(fos);
				bs.write(fileBuffer);
				bs.close();

			}
			
			catch (Exception e)
			{
				System.out.println("Exception Arised:"+e);
				e.printStackTrace();
			}
			
		}
		else
		{
			System.out.println("Problem Occured in File Uploading");
		}
		
		//==>End of Image Uploading
		
		
		m.addAttribute("catlist",this.listCategories());
		return "InsertingProduct";	
	}
	
	
	@RequestMapping(value="/productPage",method=RequestMethod.GET)
	public String showProductsPage(Model m)
	{
		List<Product> listProducts=productDAO.getProducts();
		m.addAttribute("listProducts",listProducts);
		return "ProductPage";
	}
	
	@RequestMapping(value="/productDesc/{productId}",method=RequestMethod.GET)
	public String showProductDesc(@PathVariable("productId")int productId,Model m)
	{
		Product product=productDAO.getProduct(productId);
		String categoryName=categoryDAO.getCategory(product.getCategoryId()).getCategoryName();
		m.addAttribute("ProductInfo",product);
		m.addAttribute("categoryName",categoryName);
		return "ProductDesc";
	}


	public LinkedHashMap<Integer,String> listCategories()
	{
		List<Category> listCategories=categoryDAO.getCategories();
		LinkedHashMap<Integer,String> catlist=new LinkedHashMap<Integer,String>();
		for(Category category:listCategories)
		{
			catlist.put(category.getCategoryId(),category.getCategoryName());
		}
		return catlist;
	}
	

}

