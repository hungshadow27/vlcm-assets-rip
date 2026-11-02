package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.mall.MallGoodsCanvas;
   import com.tgame.shell.view.components.mall.MysteryMallGoodsCanvas;
   import com.tgame.shell.view.components.mall.MysteryMallGoodsListRander;
   import com.tgame.shell.view.components.ride.StrengthenListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.events.TimerEvent;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   
   public class MysteryMallPanel extends FPanel
   {
      
      public static const UI_MALLPANEL_PANEL_SHOW:String = "UI_MALLPANEL_PANEL_SHOW";
      
      public static const UI_MALLPANEL_BUYBTN_CLICK:String = "UI_MALLPANEL_BUYBTN_CLICK";
      
      public static const UI_MALLPANEL_BUY:String = "UI_MALLPANEL_BUY";
      
      public static const UI_MALLPANEL_COUNTDOWN_CLICK:String = "UI_MALLPANEL_COUNTDOWN_CLICK";
      
      private var tabBar:FTabBar;
      
      private var tehuiContainer:MallGoodsCanvas;
      
      private var danyaoContainer:MallGoodsCanvas;
      
      private var otherContainer:MallGoodsCanvas;
      
      private var lijingContainer:MallGoodsCanvas;
      
      private var container:MysteryMallGoodsCanvas;
      
      private var count:FLabel;
      
      private var tip:FTextArea;
      
      private var pageContainer:Sprite;
      
      private var PaginalTxt:FTextArea;
      
      private var selectBtn3:FSimpleButton;
      
      private var listContainer3:FCanvas;
      
      private var selectList3:FList;
      
      private var ShowTxt:FTextArea;
      
      private var selectBtn4:FSimpleButton;
      
      private var listContainer4:FCanvas;
      
      private var selectList4:FList;
      
      private var topBtn:SecondButton;
      
      private var btnBtn:SecondButton;
      
      private var pageTxt:FTextArea;
      
      private var data:XML;
      
      private var currPage:int;
      
      private var pageTotal:int;
      
      private var currLabel:String;
      
      private var countDownLb:FLabel;
      
      private var myTimer:Timer;
      
      private var Ti:int;
      
      public function MysteryMallPanel()
      {
         var lb:FLabel;
         var tf:TextFormat;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 640;
         height = 469;
         titleText = LanResManager.getLanCommonTextWords("神秘商城");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.container = new MysteryMallGoodsCanvas();
         addChild(this.container);
         this.container.x = 10;
         this.container.y = 22;
         MysteryMallGoodsListRander.$parent = this;
         lb = new FLabel();
         with(lb)
         {
            x = 12;
            y = 5;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("恭喜您开启神秘商城，您有十分钟时间可以购买本商城中的折扣礼品，抓紧时间哟");
         }
         addChild(lb);
         this.countDownLb = new FLabel();
         with(this.countDownLb)
         {
            x = 480;
            y = 5;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("【剩余时间：2分59秒】");
         }
         addChild(this.countDownLb);
         this.myTimer = new Timer(1000,400);
         this.myTimer.addEventListener("timer",this.countDownFun);
         tf = new TextFormat();
         tf.align = "center";
         this.pageContainer = new Sprite();
         addChild(this.pageContainer);
         this.pageContainer.x = 10;
         this.pageContainer.y = 405;
         lb = new FLabel();
         with(lb)
         {
            x = 0;
            y = 2;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本商城将在剩余时间结束后关闭");
         }
         this.pageContainer.addChild(lb);
         this.listContainer3 = new FCanvas();
         this.listContainer3.skin = "backGroud";
         this.listContainer3.width = 64;
         this.listContainer3.height = 85;
         this.listContainer3.x = 57;
         this.listContainer3.y = 18;
         this.pageContainer.addChild(this.listContainer3);
         this.listContainer3.visible = false;
         this.selectList3 = new FList();
         this.selectList3.skin = "list";
         this.selectList3.listWidth = 56;
         this.selectList3.x = 5;
         this.selectList3.y = 2;
         this.selectList3.itemRenderer = new StrengthenListRender();
         this.selectList3.dataProvider = <list>
														<node label={5 + LanResManager.getLanCommonTextWords("项")} id="5"/>
														<node label={10 + LanResManager.getLanCommonTextWords("项")} id="10"/>
														<node label={15 + LanResManager.getLanCommonTextWords("项")} id="15"/>
														<node label={20 + LanResManager.getLanCommonTextWords("项")} id="20"/>
													</list>;
         this.listContainer3.addChild(this.selectList3);
         this.selectList3.setSelectItemByIndex(3);
         this.selectList3.addEventListener(MouseEvent.CLICK,this.onSelect1);
         this.listContainer4 = new FCanvas();
         this.listContainer4.skin = "backGroud";
         this.listContainer4.width = 69;
         this.listContainer4.height = 65;
         this.listContainer4.x = 122;
         this.listContainer4.y = 18;
         this.listContainer4.visible = false;
         this.selectList4 = new FList();
         this.selectList4.skin = "list";
         this.selectList4.listWidth = 61;
         this.selectList4.x = 5;
         this.selectList4.y = 2;
         this.selectList4.itemRenderer = new StrengthenListRender();
         this.selectList4.dataProvider = <list>
														<node label={LanResManager.getLanCommonTextWords("所有")} id="1"/>
														<node label={LanResManager.getLanCommonTextWords("折扣")} id="2"/>
														<node label={LanResManager.getLanCommonTextWords("热销")} id="3"/>
													</list>;
         this.listContainer4.addChild(this.selectList4);
         this.selectList4.setSelectItemByIndex(0);
         this.selectList4.addEventListener(MouseEvent.CLICK,this.onSelect1);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 10;
            y = 397;
            width = 619;
            height = 32;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.tip);
         this.tip.addEventListener(TextEvent.LINK,this.onTextLink);
      }
      
      private function showSelectList(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.selectBtn3:
               this.listContainer3.visible = !this.listContainer3.visible;
               break;
            case this.selectBtn4:
               this.listContainer4.visible = !this.listContainer4.visible;
         }
      }
      
      private function onBtnFun(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.topBtn:
               --this.currPage;
               break;
            case this.btnBtn:
               this.currPage += 1;
         }
         this.refresh();
      }
      
      private function onSelect1(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.selectList3:
               this.PaginalTxt.text = this.selectList3.selectItem.label;
               this.listContainer3.visible = false;
               break;
            case this.selectList4:
               this.ShowTxt.text = this.selectList4.selectItem.label;
               this.listContainer4.visible = false;
         }
         this.currPage = 1;
         this.refresh();
      }
      
      private function onTextLink(param1:TextEvent) : void
      {
         GameConfig.chongzhi();
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
      }
      
      private function refresh() : void
      {
         var _loc2_:int = 0;
         var _loc1_:XML = <list/>;
         var _loc3_:int = this.data.children().length();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.selectList4.selectItem.id == "1")
            {
               _loc1_.appendChild(this.data.children()[_loc2_]);
            }
            if(this.selectList4.selectItem.id == "2" && this.data.children()[_loc2_].@isOff == "1")
            {
               _loc1_.appendChild(this.data.children()[_loc2_]);
            }
            if(this.selectList4.selectItem.id == "3" && this.data.children()[_loc2_].@isHot == "1")
            {
               _loc1_.appendChild(this.data.children()[_loc2_]);
            }
            _loc2_++;
         }
         var _loc4_:XML = <list/>;
         _loc3_ = _loc1_.children().length();
         var _loc5_:int = int(this.selectList3.selectItem.id);
         _loc2_ = (this.currPage - 1) * _loc5_;
         while(_loc2_ < _loc3_)
         {
            _loc4_.appendChild(_loc1_.children()[_loc2_]);
            if(_loc4_.children().length() == _loc5_)
            {
               break;
            }
            _loc2_++;
         }
         this.pageTotal = Math.ceil(_loc3_ / _loc5_);
         this.setPageCount(this.currPage,this.pageTotal);
         this.container.setList(_loc4_);
      }
      
      private function setPageCount(param1:int, param2:int) : void
      {
      }
      
      private function countDownFun(param1:TimerEvent) : void
      {
         --this.Ti;
         this.countDownLb.text = "【" + LanResManager.getLanCommonTextWords("剩余时间") + "：" + int(this.Ti / 60) + LanResManager.getLanCommonTextWords("分") + int(this.Ti % 60) + LanResManager.getLanCommonTextWords("秒") + "】";
         if(this.Ti == 0)
         {
            this.onClose();
         }
      }
      
      public function setLiJin(param1:int) : void
      {
         this.pageContainer.visible = false;
         this.tip.x = 10;
         this.tip.width = 619;
         this.tip.height = 32;
         this.tip.y = 406;
         this.tip.htmlText = "<textforamt ><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您当前拥有礼金") + "：</font>" + param1 + "   <font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("礼金是系统活动所赠送的元宝，所购道具将与您绑定") + "</font></textformat>";
      }
      
      public function reset() : void
      {
         this.selectList3.setSelectItemByIndex(3);
         this.selectList4.setSelectItemByIndex(0);
         this.PaginalTxt.text = "20" + LanResManager.getLanCommonTextWords("项");
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         this.myTimer.stop();
         dispatchEvent(new BaseEvent(UI_MALLPANEL_COUNTDOWN_CLICK));
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function showPanel(param1:XML) : void
      {
         this.data = param1;
         this.container.setList(param1);
      }
      
      public function setSilver(param1:int) : void
      {
         this.pageContainer.visible = true;
         this.tip.x = 360;
         this.tip.width = 260;
         this.tip.height = 20;
         this.tip.y = 406;
         this.tip.htmlText = "<textforamt > 1" + TVersion.RMB + "=" + TVersion.RMB_2_YUANBAO + LanResManager.getLanCommonTextWords(" 元宝 ") + "<font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\'event:\'><u>" + LanResManager.getLanCommonTextWords(" 前往充值 ") + "</u></a></font><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("  当前元宝") + ": </font>" + param1 + "</textformat>";
      }
      
      public function setTime(param1:int) : void
      {
         this.Ti = param1;
         this.myTimer.stop();
         this.myTimer.reset();
         this.myTimer.repeatCount = this.Ti;
         this.myTimer.start();
      }
      
      public function countDownLbClose() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

