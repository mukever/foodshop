
var Reg = {
    ValitedUrl: "/foodshop/api/register",
    TipType: {
        Info: 1,
        Error: 2,
        Success: 3,
        Empty: 9999
    },
    RegType:
    {
        PhoneReg: "PhoneReg"
    }
};

Reg.Valited = {
    ConfimPassword: function (confirmPasswordCtrl, passwordCtrl) {
        var password = $.trim($(passwordCtrl).val());
        var confimPassword = $.trim($(confirmPasswordCtrl).val());

        Reg.Valited.ControlTip(confirmPasswordCtrl, Reg.TipType.Empty, "");

        if (password == '' || confimPassword == '') {
            Reg.Valited.ControlTip(confirmPasswordCtrl, Reg.TipType.Info, Reg.ErrorString.NoPassword);
            return false;
        }

        // 验证非法字符
        if (Form.Validate(confimPassword)) {
            Reg.Valited.ControlTip(confirmPasswordCtrl, Reg.TipType.Error, Form.VC);
            return false;
        }

        if (password.length < 6) {
            Reg.Valited.ControlTip(confirmPasswordCtrl, Reg.TipType.Error, Reg.ErrorString.PasswordMinLength);
            return false;
        }

        if (password != confimPassword) {
            Reg.Valited.ControlTip(confirmPasswordCtrl, Reg.TipType.Error, Reg.ErrorString.InconPassword);
            return false;
        }
        else {
            Reg.Valited.ControlTip(confirmPasswordCtrl, Reg.TipType.Success, "");
            return true;
        }
    },

    Email: function (ctrl) {
        var par = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

        var value = $(ctrl).val();

        Reg.Valited.ControlTip(ctrl, Reg.TipType.Empty, "");

        if (value == '') {
            Reg.Valited.ControlTip(ctrl, Reg.TipType.Info, Reg.ErrorString.NoEmail);
            return false;
        }
        else if (!par.test(value)) {
            Reg.Valited.ControlTip(ctrl, Reg.TipType.Error, Reg.ErrorString.EmailPatternWrong);
            return false;
        }

        // 验证非法字符
        if (Form.Validate(value)) {
            Reg.Valited.ControlTip(ctrl, Reg.TipType.Error, Form.VC);
            return false;
        }

        GetRemoteContent(Reg.ValitedUrl + "ValidatorIsEmail", { Email: value }, ctrl, Reg.Valited.CallBackEamil);
    },


    Mobile: function (ctrl) {

        var par = /^1[3|4|5|6|7|8|9][0-9]\d{4,8}$/

        var value = $.trim($(ctrl).val());

        Reg.Valited.ControlTip(ctrl, Reg.TipType.Empty, "");

        if (value == '') {
            Reg.Valited.ControlTip(ctrl, Reg.TipType.Info, Reg.ErrorString.NoMobile);
            return false;
        }

        if (value.length != 11) {
            Reg.Valited.ControlTip(ctrl, Reg.TipType.Error, Reg.ErrorString.MobilePatternWrong);
            return false;
        }

        if (!par.test(value)) {
            Reg.Valited.ControlTip(ctrl, Reg.TipType.Error, Reg.ErrorString.MobilePatternWrong);
            return false;
        }

        // 验证非法字符
        if (Form.Validate(value)) {
            Reg.Valited.ControlTip(ctrl, Reg.TipType.Error, Form.VC);
            return false;
        }

    },


    PhoneRegClick: function (ctrl) {

        Reg.Valited.ControlTip($("#tab1chk"), Reg.TipType.Empty, "");

        if ($(ctrl).attr("disabled") == "disabled") {
            Reg.Valited.ControlTip($("#tab1chk"), Reg.TipType.Error, Reg.ErrorString.AgreementWrong);
            return false;
        }

        if (Reg.Valited.Mobile($("#Phone_Mobile")) == false)
            return false;

        if (Reg.Valited.ConfimPassword($("#Phone_ConfimPassword"), $("#Phone_Password")) == false)
            return false;

        if (Reg.Valited.VerifyCode($("#Phone_VerifyCode")) == false)
            return false;

        $("#HdAction").val(Reg.RegType.PhoneReg);

        $("form").get(0).submit();

        return true;
    },


    ControlTip: function (ctrl, tiptype, msg) {
        $(ctrl).nextAll("span").removeClass();

        if (tiptype == Reg.TipType.Info) {
            $(ctrl).nextAll("span").html("<i></i>" + msg);
            $(ctrl).nextAll("span").addClass("pass-tip");
        }
        else if (tiptype == Reg.TipType.Error) {
            $(ctrl).nextAll("span").html("<i></i>" + msg);
            $(ctrl).nextAll("span").addClass("pass-error");
        }
        else if (tiptype == Reg.TipType.Success) {
            $(ctrl).nextAll("span").html("<i></i>" + msg);
            $(ctrl).nextAll("span").addClass("pass-succ");
        }
        else if (tiptype == Reg.TipType.Empty) {
            $(ctrl).nextAll("span").html("");
        }
    },

    ChangeTab: function (HdAction) {
        var tab1 = $("#tab1");
        var tab2 = $("#tab2");

        var tab1li = $("#tab1li");
        var tab2li = $("#tab2li");

        tab1.removeClass("active");
        tab1li.removeClass("active");

        tab2.removeClass("active");
        tab2li.removeClass("active");

        if (HdAction == '') {
            tab1.addClass("active");
            tab1li.addClass("active");
        }
        else if (HdAction == Reg.RegType.PhoneReg) {
            tab1.addClass("active");
            tab1li.addClass("active");
        }
        else if (HdAction == Reg.RegType.EmailReg) {
            tab2.addClass("active");
            tab2li.addClass("active");
        }
    },

    SubmitButonActive: function (submitctrl, checkbox) {
        if ($(checkbox).is(":checked")) {
            $(submitctrl).attr("disabled", false);
            $(submitctrl).attr("style", "");
        }
        else {
            $(submitctrl).attr("disabled", true);
            $(submitctrl).css("background-color", "grey");
        }
    }
};

function GetRemoteContent(url, postData, valitedCtrl, func) {

    $.ajax({
        type: "POST",
        url: url,
        data: postData,
        dataType: "json",
        success: function (data) {
            if (data != null)
                func(valitedCtrl, data["returncode"]);
        }
    });
}

$(function () {
    $("#Phone_Mobile").blur(function () { return Reg.Valited.Mobile(this); })
    $("#Phone_ConfimPassword").blur(function () { return Reg.Valited.ConfimPassword(this, $("#Phone_Password")); })
    $("#Phone_VerifyCode").blur(function () { return Reg.Valited.VerifyCode(this); })
    $("#Phone_SendCode").click(function () { return Reg.Valited.SendCodeClick(this, $("#Phone_Mobile")); })

    $("#tab1chk").change(function () { return Reg.Valited.SubmitButonActive($("#PhoneReg"), this) })
    $("#PhoneReg").click(function () { return Reg.Valited.PhoneRegClick($("#PhoneReg")); })

    $("#Email").blur(function () { return Reg.Valited.Email(this); })
    $("#Email_ConfimPassword").blur(function () { return Reg.Valited.ConfimPassword(this, $("#Email_Password")); })
    $("#Email_VerifyCode").blur(function () { return Reg.Valited.VerifyCode(this); })
    $("#Email_SendCode").click(function () { return Reg.Valited.SendCodeClick(this, $("#Email_Mobile")); })

    $("#tab2chk").change(function () { return Reg.Valited.SubmitButonActive($("#EmailReg"), this) })
    $("#EmailReg").click(function () { return Reg.Valited.EmailRegClick(this); })

    Reg.Valited.ChangeTab($("#HdAction").val());

    //弹出框
    $('.btn-protocol').toggle(function () {
        $('.protocol-poput').css('display', 'block');
    }, function () {
        $('.protocol-poput').css('display', 'none');
    })
    $('.protocol-poput .btn-gn').click(function () {
        $('.protocol-poput').css('display', 'none');
    })
    $('.protocol-poput .close').click(function () {
        $('.protocol-poput').css('display', 'none');
    })
})