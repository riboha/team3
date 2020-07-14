package dev.mvc.cart;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.cart.CartProc")
public class CartProc implements CartProcInter{
  @Autowired  // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private CartDAOInter cartDAO;

	@Override
	public int create(CartVO cartVO) {
    int cnt=0;
    cnt = this.cartDAO.create(cartVO);
    
    return cnt;
	}

  @Override
  public List<At_Cart_VO> at_cart_mem_list(int mem_no) {

    List<At_Cart_VO> list = null;
    list = this.cartDAO.at_cart_mem_list(mem_no);
    return list;
  }

  @Override
  public CartVO read(int cart_no) {
    CartVO cartVO =null;
    cartVO =this.cartDAO.read(cart_no);
    return cartVO;
  }


  @Override
  public int delete(CartVO cartVO) {
    int cnt=0;
    cnt = this.cartDAO.delete(cartVO);
    return cnt;
  }

  @Override
  public int update(CartVO cartVO) {
    int cnt=0;
    cnt = this.cartDAO.update(cartVO);
    return cnt;
  }

  @Override
  public int cart_sum(int mem_no) {
    int cnt=0;
    cnt = this.cartDAO.cart_sum(mem_no);
    return cnt;
  }




}
