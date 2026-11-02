package com.tgame.shell.view.components.shitu
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class getExpJiangLiPanel extends FPanel
   {
      
      public static const UI_EGTEXPJIANGLIPANEL_LIST_GET_PAGE:String = "UI_EGTEXPJIANGLIPANEL_LIST_GET_PAGE";
      
      public static const UI_EGTEXPJIANGLIPANEL_LINGQU_BTN:String = "UI_EGTEXPJIANGLIPANEL_LINGQU_BTN";
      
      public var bgImg:Bitmap;
      
      private var homePageBtn:SmallButton;
      
      private var endPageBtn:SmallButton;
      
      private var preBtn:FSimpleButton;
      
      private var nextBtn:FSimpleButton;
      
      private var pageCount:FLabel;
      
      private var BaiShiPlayerList:FList;
      
      private var test_xml:XML;
      
      public function getExpJiangLiPanel()
      {
         var v:Vector.<Bitmap>;
         var t1:FTextArea;
         var t2:FTextArea;
         var t3:FLabel;
         var line1:Bitmap;
         var line2:Bitmap;
         var line3:Bitmap;
         var t4:FLabel;
         var t5:FLabel;
         var t6:FLabel;
         this.test_xml = new XML();
         super();
         dragAble = true;
         showCloseButton = true;
         width = 360;
         height = 416;
         titleText = LanResManager.getLanCommonTextWords("领取奖励");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bgImg = new Bitmap();
         this.bgImg.x = 10;
         this.bgImg.y = 34;
         addChild(this.bgImg);
         this.bgImg.name = "ui.shitu.lingquJingyan.ui";
         v = new Vector.<Bitmap>();
         v.push(this.bgImg);
         this.DynamicManageImages = v;
         t1 = new FTextArea();
         with(t1)
         {
            width = 400;
            x = 20;
            y = 10;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("徒弟升级、出师、出师后每升级，您都将获得经验奖励。");
         }
         addChild(t1);
         t2 = new FTextArea();
         with(t2)
         {
            width = 400;
            height = 60;
            x = 18;
            y = 322;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"温馨提示：请与徒弟们保持密切联系，您的关心不仅能给予他们升级的动力，也能给自己带来丰厚的收益。");
         }
         addChild(t2);
         t3 = new FLabel();
         with(t3)
         {
            x = 65;
            y = 44;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("姓名");
         }
         addChild(t3);
         line1 = StaticValue.getBitmapByClassName("ui.line");
         with(line1)
         {
            width = 18;
            rotation = 90;
            x = 140;
            y = 42;
         }
         addChild(line1);
         line2 = StaticValue.getBitmapByClassName("ui.line");
         with(line2)
         {
            width = 18;
            rotation = 90;
            x = 180;
            y = 42;
         }
         addChild(line2);
         line3 = StaticValue.getBitmapByClassName("ui.line");
         with(line3)
         {
            width = 18;
            rotation = 90;
            x = 270;
            y = 42;
         }
         addChild(line3);
         t4 = new FLabel();
         with(t4)
         {
            x = 145;
            y = 44;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(t4);
         t5 = new FLabel();
         with(t5)
         {
            x = 200;
            y = 44;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("经验奖励");
         }
         addChild(t5);
         t6 = new FLabel();
         with(t6)
         {
            x = 282;
            y = 44;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("声望奖励");
         }
         addChild(t6);
         this.BaiShiPlayerList = new FList();
         this.BaiShiPlayerList.skin = "list";
         this.BaiShiPlayerList.isUseCellRealHeight = true;
         GetExpJiangLiListRender.$parent = this;
         this.BaiShiPlayerList.itemRenderer = new GetExpJiangLiListRender();
         this.BaiShiPlayerList.listWidth = 300;
         this.BaiShiPlayerList.listHeight = 219;
         this.BaiShiPlayerList.x = 13;
         this.BaiShiPlayerList.y = 64;
         this.test_xml = <list>
												<node id="1" name="程程乐程乐程乐程乐" level="100" exp="1000000000" sw="1000000"/> 
												<node id="2" name="程乐" level="200" exp="1000000000" sw="1000000"/> 
												<node id="3" name="程乐程" level="300" exp="1000000000" sw="1000000"/> 
												<node id="4" name="程乐程乐" level="4" exp="1000000000" sw="1000000"/> 
												<node id="5" name="程乐程乐程" level="5" exp="1000000000" sw="1000000"/> 
												<node id="6" name="程乐程乐程乐" level="6" exp="1000000000" sw="1000000"/> 
												<node id="7" name="程乐程乐程乐" level="1" exp="1000000000" sw="1000000"/> 
												<node id="8" name="程乐程乐程乐" level="2" exp="1000000000" sw="1000000"/> 
												<node id="9" name="程乐程乐程乐" level="3" exp="1000000000" sw="1000000"/> 
												<node id="10" name="程乐程乐程乐" level="3" exp="1000000000" sw="1000000"/> 
										</list>;
         addChild(this.BaiShiPlayerList);
         this.homePageBtn = new SmallButton();
         this.homePageBtn.label = LanResManager.getLanCommonTextWords("首页");
         addChild(this.homePageBtn);
         this.homePageBtn.x = 100;
         this.homePageBtn.y = 289;
         this.homePageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         addChild(this.preBtn);
         this.preBtn.x = this.homePageBtn.x + 42;
         this.preBtn.y = this.homePageBtn.y;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pageCount = new FLabel();
         with(this.pageCount)
         {
            x = preBtn.x + 22;
            y = homePageBtn.y + 1;
            textColor = StaticValue.WHITE;
            background = true;
            backgroundColor = 1186072;
            text = "100/100";
         }
         addChild(this.pageCount);
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = this.pageCount.x + 48;
         this.nextBtn.y = this.homePageBtn.y;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.endPageBtn = new SmallButton();
         this.endPageBtn.label = LanResManager.getLanCommonTextWords("尾页");
         addChild(this.endPageBtn);
         this.endPageBtn.x = this.nextBtn.x + 27;
         this.endPageBtn.y = this.homePageBtn.y;
         this.endPageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.homePageBtn:
               dispatchEvent(new BaseEvent(UI_EGTEXPJIANGLIPANEL_LIST_GET_PAGE,"",1));
               break;
            case this.preBtn:
               dispatchEvent(new BaseEvent(UI_EGTEXPJIANGLIPANEL_LIST_GET_PAGE,"",2));
               break;
            case this.nextBtn:
               dispatchEvent(new BaseEvent(UI_EGTEXPJIANGLIPANEL_LIST_GET_PAGE,"",3));
               break;
            case this.endPageBtn:
               dispatchEvent(new BaseEvent(UI_EGTEXPJIANGLIPANEL_LIST_GET_PAGE,"",4));
         }
      }
      
      public function setList(param1:XML, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false) : void
      {
         this.BaiShiPlayerList.dataProvider = param1;
         this.pageCount.text = param2 + "/" + param3;
         this.homePageBtn.enabled = this.preBtn.enabled = !param4;
         this.endPageBtn.enabled = this.nextBtn.enabled = !param5;
      }
   }
}

