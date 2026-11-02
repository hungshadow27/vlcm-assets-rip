package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.mall.MallBuyPanel;
   import com.tgame.shell.view.components.mall.MallGoodsCanvas;
   import com.tgame.shell.view.components.mall.MallGoodsListRander;
   import com.tgame.shell.view.components.ride.StrengthenListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.TextFormat;
   
   public class MallPanel extends FPanel
   {
      
      public static const UI_MALLPANEL_PANEL_SHOW:String = "UI_MALLPANEL_PANEL_SHOW";
      
      public static const UI_MALLPANEL_BUYBTN_CLICK:String = "UI_MALLPANEL_BUYBTN_CLICK";
      
      public static const UI_MALLPANEL_BUY:String = "UI_MALLPANEL_BUY";
      
      private var tabBar:FTabBar;
      
      private var tehuiContainer:MallGoodsCanvas;
      
      private var danyaoContainer:MallGoodsCanvas;
      
      private var otherContainer:MallGoodsCanvas;
      
      private var lijingContainer:MallGoodsCanvas;
      
      private var container:MallGoodsCanvas;
      
      private var count:FLabel;
      
      private var tip:FTextArea;
      
      private var tip1:FTextArea;
      
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
      
      public function MallPanel()
      {
         var tf:TextFormat;
         var lb:FLabel;
         var bg:F9GridBitmap;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 640;
         height = 469;
         titleText = LanResManager.getLanCommonTextWords("元宝商城");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.container = new MallGoodsCanvas();
         addChild(this.container);
         this.container.x = 10;
         this.container.y = 22;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("装备类"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("活动类"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("礼金类"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("限购类"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         MallGoodsListRander.$parent = this;
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
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("每页显示");
         }
         this.pageContainer.addChild(lb);
         bg = Tools.get9GridBitmpByName("inputBg");
         this.pageContainer.addChild(bg);
         bg.x = 58;
         bg.width = 44;
         this.PaginalTxt = new FTextArea();
         with(this.PaginalTxt)
         {
            defaultTextFormat = tf;
            x = 60;
            y = 0;
            width = 40;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "20" + LanResManager.getLanCommonTextWords("项");
         }
         this.pageContainer.addChild(this.PaginalTxt);
         this.selectBtn3 = new FSimpleButton();
         this.selectBtn3.skin = "bottomButton";
         this.pageContainer.addChild(this.selectBtn3);
         this.selectBtn3.x = 102;
         this.selectBtn3.y = 0;
         this.selectBtn3.addEventListener(MouseEvent.CLICK,this.showSelectList);
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
         lb = new FLabel();
         with(lb)
         {
            x = 95;
            y = 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("显示");
         }
         bg = Tools.get9GridBitmpByName("inputBg");
         bg.x = 127;
         bg.width = 46;
         this.ShowTxt = new FTextArea();
         with(this.ShowTxt)
         {
            defaultTextFormat = tf;
            x = 129;
            y = 2;
            width = 42;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("所有");
         }
         this.selectBtn4 = new FSimpleButton();
         this.selectBtn4.skin = "bottomButton";
         this.selectBtn4.x = 172;
         this.selectBtn4.y = 0;
         this.selectBtn4.addEventListener(MouseEvent.CLICK,this.showSelectList);
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
         this.topBtn = new SecondButton();
         this.topBtn.label = LanResManager.getLanCommonTextWords("上页");
         this.pageContainer.addChild(this.topBtn);
         this.topBtn.x = 162 - 30 - 5;
         this.topBtn.y = -1;
         this.topBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         this.pageTxt = new FTextArea();
         with(this.pageTxt)
         {
            defaultTextFormat = tf;
            x = 214 - 30 - 8 - 10;
            y = 2;
            width = 42;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         this.pageContainer.addChild(this.pageTxt);
         this.btnBtn = new SecondButton();
         this.btnBtn.label = LanResManager.getLanCommonTextWords("下页");
         this.pageContainer.addChild(this.btnBtn);
         this.btnBtn.x = 256 - 30 - 15 - 10;
         this.btnBtn.y = -1;
         this.btnBtn.addEventListener(MouseEvent.CLICK,this.onBtnFun);
         bg = Tools.get9GridBitmpByName("inputBg");
         this.pageContainer.addChild(bg);
         bg.x = 548 - 123 + 24 + 30 - 20;
         bg.width = 58;
         bg = Tools.get9GridBitmpByName("inputBg");
         this.pageContainer.addChild(bg);
         bg.x = 658 - 123 + 24 + 30 - 20;
         bg.width = 58;
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
         this.tip1 = new FTextArea();
         with(this.tip1)
         {
            x = 243 + 279 + 30 - 6 - 20 + 7 - 3;
            y = 406;
            width = 160;
            height = 32;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.tip1);
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
         this.tip.htmlText = "";
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("常用类"):
               this.currLabel = LanResManager.getLanCommonTextWords("常用类");
               dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",1));
               break;
            case LanResManager.getLanCommonTextWords("坐骑类"):
               this.currLabel = LanResManager.getLanCommonTextWords("坐骑类");
               dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",2));
               break;
            case LanResManager.getLanCommonTextWords("装备类"):
               this.currLabel = LanResManager.getLanCommonTextWords("装备类");
               dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",3));
               break;
            case LanResManager.getLanCommonTextWords("活动类"):
               this.currLabel = LanResManager.getLanCommonTextWords("活动类");
               dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",4));
               break;
            case LanResManager.getLanCommonTextWords("礼金类"):
               this.currLabel = LanResManager.getLanCommonTextWords("礼金类");
               dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",5));
               break;
            case LanResManager.getLanCommonTextWords("丹药类"):
               this.currLabel = LanResManager.getLanCommonTextWords("丹药类");
               dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",6));
               break;
            case LanResManager.getLanCommonTextWords("宝石类"):
               this.currLabel = LanResManager.getLanCommonTextWords("宝石类");
               dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",7));
               break;
            case LanResManager.getLanCommonTextWords("武功类"):
               this.currLabel = LanResManager.getLanCommonTextWords("武功类");
               dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",10));
               break;
            case LanResManager.getLanCommonTextWords("限购类"):
               this.currLabel = LanResManager.getLanCommonTextWords("限购类");
               dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",88));
               break;
            case LanResManager.getLanCommonTextWords("时装类"):
               dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",89));
         }
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
         this.pageTxt.text = param1 + "/" + param2;
         if(param1 == 1 && param2 == 1)
         {
            this.btnBtn.enabled = this.topBtn.enabled = false;
         }
         else
         {
            if(param1 == 1)
            {
               this.topBtn.enabled = false;
            }
            else
            {
               this.topBtn.enabled = true;
            }
            if(param1 == param2)
            {
               this.btnBtn.enabled = false;
               this.topBtn.enabled = true;
            }
            else
            {
               this.btnBtn.enabled = true;
            }
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function showPanel(param1:XML) : void
      {
         this.data = param1;
         this.currPage = 1;
         if(this.currLabel == LanResManager.getLanCommonTextWords("礼金类"))
         {
            this.container.setList(param1);
         }
         else
         {
            this.refresh();
         }
      }
      
      public function setSilver(param1:Number, param2:Number) : void
      {
         this.pageContainer.visible = true;
         if(TVersion.VERSION_LAN == TVersion.LAN_XJP)
         {
            this.tip.x = 350 - 60 - 28 + 35 - 20;
            this.tip.width = 360;
         }
         else if(TVersion.VERSION_LAN == TVersion.LAN_FAN)
         {
            this.tip.x = 341 - 60 - 28 + 35 - 20;
            this.tip.width = 360;
         }
         else
         {
            this.tip.x = 360 - 60 - 28 + 35 - 20;
            this.tip.width = 340;
         }
         this.tip.height = 20;
         this.tip.y = 406;
         this.tip.htmlText = "<textforamt > 1 Xu = 1 Vàng <font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\'event:\'><u>" + LanResManager.getLanCommonTextWords("前往充值") + "</u></a></font><font color=\'" + StaticValue.ORANGE_HTML + "\' >" + LanResManager.getLanCommonTextWords("当前元宝") + ": </font>" + param1 + "</textformat>";
         this.tip1.htmlText = "<textforamt >" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'> " + LanResManager.getLanCommonTextWords("商城金票") + ": </font>" + param2 + "</textformat>";
      }
      
      public function setLiJin(param1:int) : void
      {
         this.pageContainer.visible = false;
         this.tip.x = 10;
         this.tip.width = 619;
         this.tip.height = 32;
         this.tip.y = 406;
         this.tip.htmlText = "<textforamt ><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您当前拥有礼金") + "：</font>" + param1 + "   <font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("礼金是系统活动所赠送的元宝，所购道具将与您绑定") + "</font></textformat>";
         this.tip1.htmlText = "";
      }
      
      public function setJiLeiZhi(param1:int) : void
      {
         this.pageContainer.visible = false;
         this.tip.x = 10;
         this.tip.width = 619;
         this.tip.height = 32;
         this.tip.y = 406;
         this.tip.htmlText = "<textformat ><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + "您当前拥有积累值" + "：</font>" + param1 + "</textformat> ";
         this.tip1.htmlText = "";
      }
      
      public function showBuyPanel(param1:int, param2:String, param3:String, param4:int, param5:String, param6:Number, param7:Number, param8:int = -1, param9:int = -1, param10:int = -1, param11:int = -1) : void
      {
         if(param11 == 2)
         {
            MallBuyPanel.type = MallBuyPanel.TYPE_LIJIN;
            param6 = GameInstance.mainCharData.moneyInfo.gifts;
         }
         else
         {
            MallBuyPanel.type = MallBuyPanel.TYPE_SILVER;
         }
         var _loc12_:MallBuyPanel = new MallBuyPanel();
         _loc12_.$parent = this;
         _loc12_.setItem(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         POPWindowManager.showWindow(_loc12_);
      }
      
      public function showTongbiBuyPanel(param1:int, param2:String, param3:String, param4:int, param5:String, param6:int, param7:Number, param8:int = -1, param9:int = -1) : void
      {
         MallBuyPanel.type = MallBuyPanel.TYPE_TONGBI;
         var _loc10_:MallBuyPanel = new MallBuyPanel();
         _loc10_.$parent = this;
         _loc10_.setItem(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         POPWindowManager.showWindow(_loc10_);
      }
      
      public function showLeiJiZhiBuyPanel(param1:int, param2:String, param3:String, param4:int, param5:String, param6:Number, param7:int, param8:int = -1) : void
      {
         MallBuyPanel.type = MallBuyPanel.TYPE_LEIJIZHI;
         var _loc9_:MallBuyPanel = new MallBuyPanel();
         _loc9_.$parent = this;
         _loc9_.setItem(param1,param2,param3,param4,param5,param6,param7,param8);
         POPWindowManager.showWindow(_loc9_);
      }
      
      public function showLiJingBuyPanel(param1:int, param2:String, param3:String, param4:int, param5:String, param6:int) : void
      {
         MallBuyPanel.type = MallBuyPanel.TYPE_LIJIN;
         var _loc7_:MallBuyPanel = new MallBuyPanel();
         _loc7_.$parent = this;
         _loc7_.setItem(param1,param2,param3,param4,param5,param6);
         POPWindowManager.showWindow(_loc7_);
      }
      
      public function reset() : void
      {
         this.selectList3.setSelectItemByIndex(3);
         this.selectList4.setSelectItemByIndex(0);
         this.PaginalTxt.text = "20" + LanResManager.getLanCommonTextWords("项");
      }
   }
}

