package com.tgame.shell.view.components.ynShijiebei
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   
   public class CommitFootball extends FPanel
   {
      
      public static const UI_WORLDCUP_COMMITFOOTBALL_OK:String = "UI_WORLDCUP_COMMITFOOTBALL_OK";
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var ftCount:FTextArea;
      
      private var input:FTextInput;
      
      private var btnOK:SecondButton;
      
      private var btnCancel:SecondButton;
      
      private var num:int = 0;
      
      private var type:int = -1;
      
      public function CommitFootball()
      {
         super();
         showCloseButton = true;
         dragAble = true;
         skin = "panel_btn";
         width = 300;
         height = 170;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.ftCount.htmlText = "0";
            this.input.text = "0";
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.ft1 = new FTextArea();
         this.ft1.x = 20;
         this.ft1.y = 10;
         this.ft1.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您拥有的足球数量：") + "</font>";
         this.ft1.width = 200;
         this.ft1.height = 20;
         addChild(this.ft1);
         this.ftCount = new FTextArea();
         this.ftCount.x = 140 + 50;
         this.ftCount.y = 10;
         this.ftCount.htmlText = "0";
         this.ftCount.width = 50;
         this.ftCount.height = 20;
         addChild(this.ftCount);
         this.ft2 = new FTextArea();
         this.ft2.x = 20;
         this.ft2.y = 35;
         this.ft2.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请输入您要提交的足球数量：") + "</font>";
         this.ft2.width = 200;
         this.ft2.height = 20;
         addChild(this.ft2);
         this.input = new FTextInput();
         this.input.textColor = 16777215;
         this.input.border = true;
         addChild(this.input);
         this.input.x = 190;
         this.input.text = "0";
         this.input.y = 35;
         this.input.width = 50;
         this.input.height = 20;
         this.ft3 = new FTextArea();
         this.ft3.x = 20;
         this.ft3.y = 65;
         this.ft3.width = 270;
         this.ft3.height = 20;
         addChild(this.ft3);
         this.btnOK = new SecondButton();
         this.btnOK.label = LanResManager.getLanCommonTextWords("提交");
         this.btnOK.x = 80;
         this.btnOK.y = 105;
         this.btnOK.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnOK);
         this.btnCancel = new SecondButton();
         this.btnCancel.label = LanResManager.getLanCommonTextWords("取消");
         this.btnCancel.x = 160;
         this.btnCancel.y = 105;
         this.btnCancel.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnCancel);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         switch(param1.target)
         {
            case this.btnOK:
               _loc2_ = "";
               if(this.input.text == null)
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("请输入要提交的物品数量！"));
                  return;
               }
               _loc3_ = int(this.input.text);
               if(_loc3_ > this.num)
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("您输入的数量超过您拥有的数量，请重新输入！"));
                  return;
               }
               if(_loc3_ <= 0)
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("您输入正确的数量！"));
                  return;
               }
               dispatchEvent(new BaseEvent(UI_WORLDCUP_COMMITFOOTBALL_OK,"",[this.input.text,this.type]));
               this.onClose();
               break;
            case this.btnCancel:
               this.onClose();
         }
      }
      
      public function setData(param1:int, param2:int) : void
      {
         this.type = param1;
         this.ft3.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("注：本服累计提交一定数量，可额外领取礼包。") + "</font>";
         if(param1 == 1)
         {
            titleText = LanResManager.getLanCommonTextWords("提交足球");
            this.ft1.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您拥有的足球数量：") + "</font>";
            this.ft2.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请输入您要提交的足球数量：") + "</font>";
            this.ft3.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("注：一个足球可兑换8个武林盟主令。") + "</font>";
         }
         else if(param1 == 2)
         {
            titleText = LanResManager.getLanCommonTextWords("提交茶瓶");
            this.ft1.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您拥有的茶瓶数量：") + "</font>";
            this.ft2.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请输入您要提交的茶瓶数量：") + "</font>";
         }
         else if(param1 == 3)
         {
            titleText = LanResManager.getLanCommonTextWords("提交蜡烛");
            this.ft1.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您拥有的蜡烛数量：") + "</font>";
            this.ft2.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请输入您要提交的蜡烛数量：") + "</font>";
         }
         else if(param1 == 4)
         {
            titleText = LanResManager.getLanCommonTextWords("提交圣诞帽子");
            this.ft1.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您拥有的圣诞帽子数量：") + "</font>";
            this.ft2.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请输入您要提交的圣诞帽子数量：") + "</font>";
         }
         else if(param1 == 5)
         {
            titleText = LanResManager.getLanCommonTextWords("提交圣诞支");
            this.ft1.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您拥有的圣诞支数量：") + "</font>";
            this.ft2.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请输入您要提交的圣诞支数量：") + "</font>";
         }
         else if(param1 == 7)
         {
            titleText = LanResManager.getLanCommonTextWords("提交MIK足球");
            this.ft1.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您拥有的MIK足球数量：") + "</font>";
            this.ft2.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请输入您要提交的MIK足球数量：") + "</font>";
            this.ft3.htmlText = " ";
            this.input.x += 15;
            this.ftCount.x += 15;
         }
         else if(param1 == 8)
         {
            titleText = LanResManager.getLanCommonTextWords("提交狮子");
            this.ft1.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您拥有的狮子数量：") + "</font>";
            this.ft2.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请输入您要提交的狮子数量：") + "</font>";
            this.ft3.htmlText = " ";
            this.input.x = 190;
            this.ftCount.x = 190;
         }
         else if(param1 == 9)
         {
            titleText = LanResManager.getLanCommonTextWords("提交图书");
            this.ft1.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您拥有的图书数量：") + "</font>";
            this.ft2.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请输入您要提交的图书数量：") + "</font>";
            this.ft3.htmlText = " ";
            this.input.x = 190;
            this.ftCount.x = 190;
         }
         else if(param1 == 10)
         {
            titleText = LanResManager.getLanCommonTextWords("提交灯谜");
            this.ft1.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您拥有的灯谜数量：") + "</font>";
            this.ft2.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请输入您要提交的灯谜数量：") + "</font>";
            this.ft3.htmlText = " ";
            this.input.x = 190;
            this.ftCount.x = 190;
         }
         else if(param1 == 11)
         {
            titleText = LanResManager.getLanCommonTextWords("提交玉兔");
            this.ft1.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您拥有的玉兔数量：") + "</font>";
            this.ft2.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请输入您要提交的玉兔数量：") + "</font>";
            this.ft3.htmlText = " ";
            this.input.x = 190;
            this.ftCount.x = 190;
         }
         this.num = param2;
         this.ftCount.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + this.num + "</font>";
      }
   }
}

