package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.playershop.PlayerShoplistItemRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import flash.utils.getTimer;
   
   public class PlayerShopListPanel extends FPanel
   {
      
      public static const UI_BACKPACK_PLAYERSHOPLIST_LOOKBTN_CLICK:String = "UI_BACKPACK_PLAYERSHOPLIST_LOOKBTN_CLICK";
      
      public static const UI_BACKPACK_PLAYERSHOPLIST_INFOBTN_CLICK:String = "UI_BACKPACK_PLAYERSHOPLIST_INFOBTN_CLICK";
      
      public static const UI_BACKPACK_PLAYERSHOPLIST_REFRESHBTN_CLICK:String = "UI_BACKPACK_PLAYERSHOPLIST_REFRESHBTN_CLICK";
      
      public static const UI_BACKPACK_PLAYERSHOPLIST_PAGE:String = "UI_BACKPACK_PLAYERSHOPLIST_PAGE";
      
      public static const UI_BACKPACK_PLAYERSHOPLIST_SEARCH:String = "BACKPACK_PLAYERSHOPLIST_SEARCH";
      
      private var playerList:FList;
      
      private var homePageBtn:SmallButton;
      
      private var endPageBtn:SmallButton;
      
      private var preBtn:FSimpleButton;
      
      private var nextBtn:FSimpleButton;
      
      private var pageCount:FTextArea;
      
      private var lookBtn:SecondButton;
      
      private var refreshBtn:SecondButton;
      
      private var infoBtn:SecondButton;
      
      private var time:Number;
      
      private var item:Object;
      
      private var count:FLabel;
      
      private var btn:FSimpleButton;
      
      private var searchArea:FLabel;
      
      private var searchKey:FTextInput;
      
      private var menuContainer:FCanvas;
      
      private var menuList:FList;
      
      private var searchBtn:SmallButton;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public function PlayerShopListPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var lb:FLabel;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 460;
         height = 339;
         titleText = LanResManager.getLanCommonTextWords("随身摊位列表");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
         }
         this.tipCanvas.addChild(this.tip);
         img = new Bitmap();
         img.name = "ui.char.shop.list.ui";
         addChild(img);
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         lb = new FLabel();
         with(lb)
         {
            x = 8;
            y = 7;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"摊位列表信息");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 42;
            y = 244;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"摊位列表搜索");
         }
         addChild(lb);
         this.btn = new FSimpleButton();
         this.btn.skin = "bottomButton";
         addChild(this.btn);
         this.btn.x = 192;
         this.btn.y = 243;
         this.btn.addEventListener(MouseEvent.CLICK,this.showMenu);
         this.searchArea = new FLabel();
         with(this.searchArea)
         {
            x = 110;
            y = 244;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanCommonTextWords("按物品名称");
         }
         addChild(this.searchArea);
         this.searchKey = new FTextInput();
         with(this.searchKey)
         {
            x = 280;
            y = 244;
            width = 84;
            height = 20;
            multiline = false;
            wordWrap = false;
            textColor = StaticValue.WHITE;
         }
         addChild(this.searchKey);
         this.searchKey.setMaxChars(12);
         this.searchBtn = new SmallButton();
         this.searchBtn.label = LanResManager.getLanCommonTextWords("搜索");
         addChild(this.searchBtn);
         this.searchBtn.x = 374;
         this.searchBtn.y = 242;
         this.searchBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.playerList = new FList();
         this.playerList.doubleClickEnabled = true;
         this.playerList.skin = "list";
         this.playerList.listWidth = 436;
         this.playerList.listHeight = 210;
         this.playerList.itemRenderer = new PlayerShoplistItemRender();
         addChild(this.playerList);
         this.playerList.x = 12;
         this.playerList.y = 27;
         this.playerList.addEventListener(MouseEvent.CLICK,this.onDoubleClick);
         this.playerList.addEventListener(MouseEvent.MOUSE_OVER,this.onListMouse);
         this.playerList.addEventListener(MouseEvent.MOUSE_OUT,this.onListMouse);
         this.homePageBtn = new SmallButton();
         this.homePageBtn.label = LanResManager.getLanCommonTextWords("首页");
         addChild(this.homePageBtn);
         this.homePageBtn.x = 141;
         this.homePageBtn.y = 275;
         this.homePageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         addChild(this.preBtn);
         this.preBtn.x = 180;
         this.preBtn.y = 275;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pageCount = new FTextArea();
         with(this.pageCount)
         {
            x = 200;
            y = 275;
            width = 47;
            height = 20;
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            textColor = StaticValue.WHITE;
         }
         addChild(this.pageCount);
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = 247;
         this.nextBtn.y = 275;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.endPageBtn = new SmallButton();
         this.endPageBtn.label = LanResManager.getLanCommonTextWords("尾页");
         addChild(this.endPageBtn);
         this.endPageBtn.x = 271;
         this.endPageBtn.y = 275;
         this.endPageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.refreshBtn = new SecondButton();
         this.refreshBtn.label = LanResManager.getLanCommonTextWords("刷新");
         addChild(this.refreshBtn);
         this.refreshBtn.x = 86;
         this.refreshBtn.y = 274;
         this.refreshBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lookBtn = new SecondButton();
         this.lookBtn.label = LanResManager.getLanCommonTextWords("查看摊位");
         addChild(this.lookBtn);
         this.lookBtn.x = this.endPageBtn.width + 271 + 10;
         this.lookBtn.y = 274;
         this.lookBtn.enabled = false;
         this.lookBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.infoBtn = new SecondButton();
         this.infoBtn.label = LanResManager.getLanCommonTextWords("查看信息");
         addChild(this.infoBtn);
         this.infoBtn.x = panelWidth - 10 - this.infoBtn.width;
         this.infoBtn.y = 274;
         this.infoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.count = new FLabel();
         with(this.count)
         {
            x = 10;
            y = 276;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("总数") + "：9999";
         }
         addChild(this.count);
         this.menuContainer = new FCanvas();
         this.menuContainer.skin = "backGroud";
         this.menuContainer.width = 90;
         this.menuContainer.x = 104;
         this.menuContainer.y = 262;
         addChild(this.menuContainer);
         this.menuContainer.visible = false;
         this.menuList = new FList();
         this.menuList.skin = "menuList_chat";
         this.menuList.listWidth = 86;
         this.menuList.x = this.menuList.y = 2;
         this.menuContainer.addChild(this.menuList);
         this.menuList.dataProvider = <list>
															<node label={LanResManager.getLanCommonTextWords("按物品名称")} id="1"/>
															<node label={LanResManager.getLanCommonTextWords("按坐骑名称")} id="2"/>
															<node label={LanResManager.getLanCommonTextWords("按出售人名称")} id="0"/>
														</list>;
         this.menuContainer.height = this.menuList.height + 4;
         this.menuList.setSelectItemByIndex(0);
         this.menuList.addEventListener(MouseEvent.CLICK,this.onListClick);
      }
      
      private function showMenu(param1:MouseEvent) : void
      {
         this.menuContainer.visible = !this.menuContainer.visible;
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         this.searchArea.text = this.menuList.selectItem.label;
         this.menuContainer.visible = false;
      }
      
      private function onDoubleClick(param1:MouseEvent) : void
      {
         if(Boolean(getTimer() - this.time < 500) && Boolean(this.playerList.selectItem) && this.item == this.playerList.selectItem)
         {
            dispatchEvent(new BaseEvent(UI_BACKPACK_PLAYERSHOPLIST_LOOKBTN_CLICK,"",int(this.playerList.selectItem.label)));
         }
         this.time = getTimer();
         this.item = this.playerList.selectItem;
      }
      
      private function onListMouse(param1:MouseEvent) : void
      {
         var _loc2_:FListCellRenderer = null;
         var _loc3_:Object = null;
         var _loc4_:Point = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               Tools.currentStage.addChild(this.tipCanvas);
               this.tipCanvas.visible = false;
               this.playerList.addEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.target as TextField)
               {
                  _loc2_ = (param1.target as TextField).parent as FListCellRenderer;
                  _loc3_ = _loc2_.data;
                  this.tip.text = _loc3_.shopper;
                  this.tipCanvas.width = this.tip.width + 4;
                  this.tipCanvas.height = this.tip.height + 4;
                  this.tipCanvas.visible = true;
                  _loc4_ = _loc2_.parent.localToGlobal(new Point(_loc2_.x,_loc2_.y));
                  this.tipCanvas.x = _loc4_.x - this.tipCanvas.width;
                  this.tipCanvas.y = _loc4_.y;
               }
               else
               {
                  this.tipCanvas.visible = false;
               }
               break;
            case MouseEvent.MOUSE_OUT:
               this.playerList.removeEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               Tools.currentStage.removeChild(this.tipCanvas);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.homePageBtn:
               dispatchEvent(new BaseEvent(UI_BACKPACK_PLAYERSHOPLIST_PAGE,"",1));
               break;
            case this.preBtn:
               dispatchEvent(new BaseEvent(UI_BACKPACK_PLAYERSHOPLIST_PAGE,"",2));
               break;
            case this.nextBtn:
               dispatchEvent(new BaseEvent(UI_BACKPACK_PLAYERSHOPLIST_PAGE,"",3));
               break;
            case this.endPageBtn:
               dispatchEvent(new BaseEvent(UI_BACKPACK_PLAYERSHOPLIST_PAGE,"",4));
               break;
            case this.refreshBtn:
               dispatchEvent(new BaseEvent(UI_BACKPACK_PLAYERSHOPLIST_REFRESHBTN_CLICK));
               break;
            case this.lookBtn:
               dispatchEvent(new BaseEvent(UI_BACKPACK_PLAYERSHOPLIST_LOOKBTN_CLICK,"",int(this.playerList.selectItem.label)));
               break;
            case this.infoBtn:
               dispatchEvent(new BaseEvent(UI_BACKPACK_PLAYERSHOPLIST_INFOBTN_CLICK,"",int(this.playerList.selectItem.label)));
               break;
            case this.searchBtn:
               if(this.searchKey.text == "")
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("请输入关键字"));
                  break;
               }
               dispatchEvent(new BaseEvent(UI_BACKPACK_PLAYERSHOPLIST_SEARCH,"",[int(this.menuList.selectItem.id),this.searchKey.text]));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setShopTotal(param1:int) : void
      {
         this.count.text = LanResManager.getLanCommonTextWords("总数") + "：" + param1;
      }
      
      public function setShopList(param1:XML, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false) : void
      {
         this.playerList.dataProvider = param1;
         if(param1.children().length() > 0)
         {
            this.playerList.setSelectItemByIndex(0);
            this.lookBtn.enabled = true;
            this.infoBtn.enabled = true;
         }
         else
         {
            this.lookBtn.enabled = false;
            this.infoBtn.enabled = false;
         }
         this.pageCount.text = param3 + "/" + param2;
         if(param3 == 1)
         {
            this.preBtn.enabled = this.homePageBtn.enabled = false;
         }
         else
         {
            this.preBtn.enabled = this.homePageBtn.enabled = true;
         }
         if(param3 == param2)
         {
            this.endPageBtn.enabled = this.nextBtn.enabled = false;
         }
         else
         {
            this.endPageBtn.enabled = this.nextBtn.enabled = true;
         }
      }
   }
}

