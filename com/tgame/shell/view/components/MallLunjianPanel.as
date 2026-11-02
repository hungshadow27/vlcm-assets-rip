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
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.mall.MallBuyLunjianPanel;
   import com.tgame.shell.view.components.mall.MallBuyPanel;
   import com.tgame.shell.view.components.mall.MallGoodsCanvas;
   import com.tgame.shell.view.components.mall.MallGoodsListLunjianRander;
   import com.tgame.shell.view.components.mall.MallGoodsLunjianCanvas;
   import com.tgame.shell.view.components.ride.StrengthenListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.TextFormat;
   
   public class MallLunjianPanel extends FPanel
   {
      
      public static const UI_MALLPANEL_PANEL_SHOW:String = "UI_MALLPANEL_PANEL_SHOW";
      
      public static const UI_MALLPANEL_BUYBTN_CLICK:String = "UI_MALLPANEL_BUYBTN_CLICK";
      
      public static const UI_MALLPANEL_LUNJIAN_BUY:String = "UI_MALLPANEL_LUNJIAN_BUY";
      
      public static const UI_MALLLUNJIAN_SHENGWANGDIAN_CLICK:String = "UI_MALLLUNJIAN_SHENGWANGDIAN_CLICK";
      
      private var tabBar:FTabBar;
      
      private var tehuiContainer:MallGoodsCanvas;
      
      private var danyaoContainer:MallGoodsCanvas;
      
      private var otherContainer:MallGoodsCanvas;
      
      private var lijingContainer:MallGoodsCanvas;
      
      private var container:MallGoodsLunjianCanvas;
      
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
      
      private var lb:FLabel;
      
      private var lb1:FLabel;
      
      private var chengzhanLb:FLabel;
      
      private var chengzhanLx:FLabel;
      
      private var lunjianLb:FLabel;
      
      public function MallLunjianPanel()
      {
         var tf:TextFormat;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 640;
         height = 469;
         titleText = LanResManager.getLanCommonTextWords("论剑声望商店");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 250;
            y = 6;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("请勿囤积声望，声望会在每周一0点定时清空");
         }
         addChild(this.lb);
         this.container = new MallGoodsLunjianCanvas();
         addChild(this.container);
         this.container.x = 10;
         this.container.y = 22;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("装备类"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("商城道具类"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("其他类"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         MallGoodsListLunjianRander.$parent = this;
         tf = new TextFormat();
         tf.align = "center";
         this.pageContainer = new Sprite();
         addChild(this.pageContainer);
         this.pageContainer.x = 10;
         this.pageContainer.y = 405;
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
         this.pageTxt = new FTextArea();
         with(this.pageTxt)
         {
            defaultTextFormat = tf;
            x = 214;
            y = 2;
            width = 42;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         this.pageTxt.visible = false;
         this.pageContainer.addChild(this.pageTxt);
         this.chengzhanLx = new FLabel();
         with(this.chengzhanLx)
         {
            x = 0;
            y = 2;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("当前城战声望：");
         }
         this.pageContainer.addChild(this.chengzhanLx);
         this.chengzhanLb = new FLabel();
         with(this.chengzhanLb)
         {
            x = 161;
            y = 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         this.pageContainer.addChild(this.chengzhanLb);
         this.lb1 = new FLabel();
         with(this.lb1)
         {
            x = 200;
            y = 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级达到60级后参加襄阳攻城战活动，可获得城战声望");
         }
         this.pageContainer.addChild(this.lb1);
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.showBuyPanel(1,"2","3",0,4,"5",6,-1);
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
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("装备类"):
               this.currLabel = LanResManager.getLanCommonTextWords("装备类");
               dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",1));
               break;
            case LanResManager.getLanCommonTextWords("商城道具类"):
               this.currLabel = LanResManager.getLanCommonTextWords("商城道具类");
               dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",2));
               break;
            case LanResManager.getLanCommonTextWords("其他类"):
               this.currLabel = LanResManager.getLanCommonTextWords("其他类");
               dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",3));
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
         this.container.setList(param1);
         this.currPage = 1;
      }
      
      public function setSilver(param1:int) : void
      {
      }
      
      public function setLiJin(param1:int) : void
      {
      }
      
      public function showBuyPanel(param1:int, param2:String, param3:String, param4:int, param5:int, param6:String, param7:int, param8:int = -1) : void
      {
         MallBuyPanel.type = MallBuyPanel.TYPE_SILVER;
         var _loc9_:MallBuyLunjianPanel = new MallBuyLunjianPanel();
         _loc9_.$parent = this;
         _loc9_.setItem(param1,param2,param3,param4,param5,param6,param7,param8);
         POPWindowManager.showWindow(_loc9_);
      }
      
      public function reset() : void
      {
         this.selectList3.setSelectItemByIndex(3);
         this.selectList4.setSelectItemByIndex(0);
         this.PaginalTxt.text = "20" + LanResManager.getLanCommonTextWords("项");
      }
      
      public function setShengwang(param1:int, param2:int) : void
      {
         this.chengzhanLb.text = String(param1);
         if(param2 == 1)
         {
            this.chengzhanLx.text = LanResManager.getLanCommonTextWords("当前城战声望：");
            this.lb1.text = LanResManager.getLanCommonTextWords("等级达到60级后参加襄阳攻城战活动，可获得城战声望");
            this.titleText = LanResManager.getLanCommonTextWords("城战声望商店");
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("装备类"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("商城道具类"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("其他类"),this.onTabClick);
         }
         else if(param2 == 2)
         {
            this.chengzhanLx.text = LanResManager.getLanCommonTextWords("当前论剑声望：");
            this.lb1.text = LanResManager.getLanCommonTextWords("等级达到60级后参加跨服论剑台活动，可获得论剑声望");
            this.titleText = LanResManager.getLanCommonTextWords("论剑声望商店");
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("装备类"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("商城道具类"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("其他类"),this.onTabClick);
         }
         else if(param2 == 3)
         {
            this.chengzhanLx.text = LanResManager.getLanCommonTextWords("当前师徒声望：");
            this.lb1.text = "";
            this.titleText = LanResManager.getLanCommonTextWords("师徒声望商城");
            this.lb.text = "";
            this.tabBar.removeAllButton();
            dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",3));
         }
         else if(param2 == 5)
         {
            this.chengzhanLx.text = LanResManager.getLanCommonTextWords("当前侠侣值：");
            this.lb1.text = LanResManager.getLanCommonTextWords("战斗力超过的夫妻组队参加跨服夫妻竞技，可获得侠侣值");
            this.lb1.x = 200 - 55;
            this.titleText = LanResManager.getLanCommonTextWords("侠侣商店");
            this.lb.text = LanResManager.getLanCommonTextWords("请勿囤积侠侣值，声望会在每月一号点定时清空");
            this.tabBar.removeAllButton();
            dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",3));
         }
         else if(param2 == 6)
         {
            this.chengzhanLx.text = LanResManager.getLanCommonTextWords("当前功勋值：");
            this.lb1.text = LanResManager.getLanCommonTextWords("参加跨服卧虎藏龙，可获得功勋值");
            this.titleText = LanResManager.getLanCommonTextWords("功勋商店");
            this.lb.text = "";
            this.tabBar.removeAllButton();
            dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",3));
         }
         else if(param2 == 7)
         {
            this.chengzhanLx.text = LanResManager.getLanCommonTextWords("当前积分：");
            this.lb1.text = LanResManager.getLanCommonTextWords("参加跨服吞食天地，可获得积分");
            this.titleText = LanResManager.getLanCommonTextWords("积分商店");
            this.lb.text = "";
            this.tabBar.removeAllButton();
            dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",3));
         }
         else if(param2 == 8)
         {
            this.chengzhanLx.text = LanResManager.getLanCommonTextWords("当前武魂值：");
            this.lb1.text = LanResManager.getLanCommonTextWords("参加跨服倚天屠龙，可获得武魂值");
            this.lb.text = "";
            this.titleText = LanResManager.getLanCommonTextWords("武魂商店");
            this.tabBar.removeAllButton();
            dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",3));
         }
         else if(param2 == 9)
         {
            this.chengzhanLx.text = LanResManager.getLanCommonTextWords("当前江湖万能录：");
            this.lb1.text = LanResManager.getLanCommonTextWords("参加跨服倚天屠龙，可获得江湖万能录");
            this.lb.text = "";
            this.titleText = LanResManager.getLanCommonTextWords("江湖宝藏");
            this.tabBar.removeAllButton();
            dispatchEvent(new BaseEvent(UI_MALLPANEL_PANEL_SHOW,"",3));
         }
      }
   }
}

