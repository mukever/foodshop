package com.ranchel.foodshop.api;

import com.ranchel.foodshop.dao.BuyerInfoDao;
import com.ranchel.foodshop.dateobject.ApiMessage;
import com.ranchel.foodshop.dateobject.Buyer_Info;
import com.ranchel.foodshop.dateobject.FoodInfo;
import com.ranchel.foodshop.enums.ApiCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


@RestController
@RequestMapping("/api")
public class UserInfoApi {
    @Autowired
    private BuyerInfoDao buyerInfoDao;


    @RequestMapping("/checkusername")
    @ResponseBody
    public ApiMessage BuyerUsernameCheckin(HttpServletRequest request, HttpServletResponse response) {

        //跨域设置
        Common.common(response);

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
    @ResponseBody
    public ApiMessage BuyerRegister(HttpServletRequest request, HttpServletResponse response) {

        //跨域设置
        Common.common(response);
        ApiMessage apiMessage = new ApiMessage();
        try{
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            System.out.println(username+"/ "+password);

            Buyer_Info buyer_info = new Buyer_Info();
            buyer_info.setUsername(username);
            buyer_info.setPassword(password);

            buyerInfoDao.save(buyer_info);

            apiMessage.setCode(ApiCodeEnum.USERREGISTERSUCESS.getCode());
            apiMessage.setMessage(ApiCodeEnum.USERREGISTERSUCESS.getMessage());


        }catch (Exception e){
            apiMessage.setCode(ApiCodeEnum.USERREGISTERFAIL.getCode());
            apiMessage.setMessage(ApiCodeEnum.USERREGISTERFAIL.getMessage());
        }

        return apiMessage;
    }

    @RequestMapping("/login")
    @ResponseBody

    public ApiMessage BuyerLogin(
            HttpSession session,
            HttpServletRequest request, HttpServletResponse response) {

        //跨域设置
        Common.common(response);
        ApiMessage apiMessage = new ApiMessage();
        try{
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            System.out.println(username+"/ "+password);
            if(username!=null){
                Buyer_Info buyer_info = buyerInfoDao.findByUsernameAndPassword(username,password);
                    if(buyer_info !=null) {

                        //登录成功
                        apiMessage.setCode(ApiCodeEnum.USERLOGINSUCCESS.getCode());
                        apiMessage.setMessage(ApiCodeEnum.USERLOGINSUCCESS.getMessage());

//                        //设置session
//                        HttpSession session = request.getSession();
                        session.setAttribute("username", username);

                    }

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

        return apiMessage;
    }


}
