package controller;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import dto.FurnitureDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ProdCRUDService;
import service.ProdCRUDServiceImpl;

public class ProdCRUDController implements Controller{
	ProdCRUDService service = new ProdCRUDServiceImpl();
	
	public ProdCRUDController() {}
	
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {

		return null;
	}
	
	public ModelAndView create(HttpServletRequest request, HttpServletResponse response) throws SQLException {
	    String furnitureNumber = request.getParameter("furnitureNumber");
	    String furnitureName = request.getParameter("furnitureName");
	    String furnitureDescription = request.getParameter("furnitureDescription");
	    String furnitureImgSrc = request.getParameter("furnitureImgSrc");
	    int price = Integer.parseInt(request.getParameter("price"));
	    int stock = Integer.parseInt(request.getParameter("stock"));
	    String category = request.getParameter("category");
	    String texture = request.getParameter("texture");
	    
	    // 현재 날짜를 yyyy-MM-dd HH:mm:ss 형식으로 가져오기
	    LocalDateTime now = LocalDateTime.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    String regDate = now.format(formatter);

	    // 새로운 FurnitureDTO 객체 생성
	    FurnitureDTO newFurniture = new FurnitureDTO(furnitureNumber, furnitureName, furnitureDescription, price, stock, category, texture, furnitureImgSrc);

	    // 서비스를 통해 상품 추가
	    service.create(newFurniture);

	    // 추가된 상품을 포함하여 모든 상품 리스트를 다시 불러옴
	    List<FurnitureDTO> list = service.selectAll();
	    request.setAttribute("list", list);

	    return new ModelAndView("admin/adminCRUD.jsp");
	}
	
	public ModelAndView selectAll (HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// System.out.println("controller 오니?");
		List<FurnitureDTO> list = service.selectAll();
		/*
		 * for (FurnitureDTO furnitureDTO : list) { System.out.println(furnitureDTO); }
		 */
		request.setAttribute("list", list);
		return new ModelAndView("admin/adminCRUD.jsp");
	}
	
	public ModelAndView delete (HttpServletRequest request, HttpServletResponse response) throws SQLException {
		System.out.println("controller 오니?");
		int furnitureSeq = Integer.parseInt(request.getParameter("furnitureSeq"));
		
		service.delete(furnitureSeq);
		
		List<FurnitureDTO> list = service.selectAll();
		request.setAttribute("list", list);
		
		return new ModelAndView("admin/adminCRUD.jsp");
	}
}
