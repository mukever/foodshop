package com.ranchel.foodshop.controller;

import com.ranchel.foodshop.api.Common;
import com.ranchel.foodshop.dao.BuyerInfoDao;
import com.ranchel.foodshop.dateobject.ApiMessage;
import com.ranchel.foodshop.dateobject.Buyer_Info;
import com.ranchel.foodshop.enums.ApiCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/buyer")
public class BuyerUserInfo {

    @Autowired
    private BuyerInfoDao buyerInfoDao;

    @RequestMapping("/checkusername")
    public ApiMessage BuyerUsernameCheckin(HttpServletRequest request, HttpServletResponse response) {


        ApiMessage apiMessage = new ApiMessage();
        String  username = request.getParameter("username");
        Buyer_Info buyer_info = null;
        try {
            buyer_info = buyerInfoDao.findByUsername(username);
        }catch (NullPointerException e){
            apiMessage.setCode(ApiCodeEnum.USERNOTEXSIT.getCode());
            apiMessage.setMessage(ApiCodeEnum.USERNOTEXSIT.getMessage());
            return apiMessage;
        }
        if(buyer_info!=null){
            apiMessage.setCode(ApiCodeEnum.USEREXSIT.getCode());
            apiMessage.setMessage(ApiCodeEnum.USEREXSIT.getMessage());
        }else {
            apiMessage.setCode(ApiCodeEnum.USERNOTEXSIT.getCode());
            apiMessage.setMessage(ApiCodeEnum.USERNOTEXSIT.getMessage());
        }

        return apiMessage;
    }

    @RequestMapping("/register")
    public ModelAndView BuyerRegister(HttpServletRequest request, HttpServletResponse response) {


        return new ModelAndView("buyer/register");
    }

    @RequestMapping("/login")
    public ModelAndView BuyerLogin(HttpServletRequest request, HttpServletResponse response) {

        ApiMessage apiMessage = new ApiMessage();
        try{
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            System.out.println(username+"/ "+password);

            Buyer_Info buyer_info = buyerInfoDao.findByUsernameAndPassword(username,password);
            if(buyer_info !=null){

                //登录成功
                apiMessage.setCode(ApiCodeEnum.USERLOGINSUCCESS.getCode());
                apiMessage.setMessage(ApiCodeEnum.USERLOGINSUCCESS.getMessage());

                //设置session
                HttpSession session = request.getSession();
                session.setAttribute("username",username);


            }else {
                apiMessage.setCode(ApiCodeEnum.USERLOGINFAIL.getCode());
                apiMessage.setMessage(ApiCodeEnum.USERLOGINFAIL.getMessage());
            }

        }catch (NullPointerException e){
            apiMessage.setCode(ApiCodeEnum.USERLOGINFAIL.getCode());
            apiMessage.setMessage(ApiCodeEnum.USERLOGINFAIL.getMessage());
        }catch (Exception e){
            apiMessage.setCode(ApiCodeEnum.USERLOGINERROR.getCode());
            apiMessage.setMessage(ApiCodeEnum.USERLOGINERROR.getMessage());
        }

        return new ModelAndView("buyer/login");
    }


    @RequestMapping("/logout")
    @ResponseBody
    public ApiMessage BuyerLogout(HttpSession session, HttpServletResponse response) {


        ApiMessage apiMessage = new ApiMessage();
        try{

            session.removeAttribute("username");
            session.removeAttribute("cart");
            apiMessage.setCode(ApiCodeEnum.USERLOGOUTSUCCESS.getCode());
            apiMessage.setMessage(ApiCodeEnum.USERLOGOUTSUCCESS.getMessage());

        }catch (NullPointerException e){
            apiMessage.setCode(ApiCodeEnum.USERLOGOUTFAIL.getCode());
            apiMessage.setMessage(ApiCodeEnum.USERLOGOUTFAIL.getMessage());
        }catch (Exception e){
            apiMessage.setCode(ApiCodeEnum.USERLOGOUTERROR.getCode());
            apiMessage.setMessage(ApiCodeEnum.USERLOGOUTERROR.getMessage());
        }

        return apiMessage;
    }

}
