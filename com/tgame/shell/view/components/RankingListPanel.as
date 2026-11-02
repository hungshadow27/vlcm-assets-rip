package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.rankinglist.PlayerRankingListCanvas;
   import com.tgame.shell.view.components.rankinglist.RankingListTotalCanvas;
   import com.tgame.shell.view.components.rankinglist.RankingListsRanader;
   import com.tgame.shell.view.components.rankinglist.RideRankingListCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import gs.TweenMax;
   
   public class RankingListPanel extends FPanel
   {
      
      public static const UI_RANKINGLIST_LIST_SHOW:String = "UI_RANKINGLIST_LIST_SHOW";
      
      public static const UI_RANKINGLIST_LIST_GET_PAGE:String = "UI_RANKINGLIST_LIST_GET_PAGE";
      
      public static const UI_RANKINGLIST_PARTICULAR_INFO_SHOW:String = "UI_RANKINGLIST_PARTICULAR_INFO_SHOW";
      
      public static const UI_RANKINGLIST_LIST_MUTUAL:String = "UI_RANKINGLIST_LIST_MUTUAL";
      
      public static const UI_RANKINGLIST_LIST_SEARCH_BTN_CLICK:String = "UI_RANKINGLIST_LIST_SEARCH_BTN_CLICK";
      
      public static const UI_RANKINGLIST_LIST_STATISTICS_BTN_CLICK:String = "UI_RANKINGLIST_LIST_STATISTICS_BTN_CLICK";
      
      private var tabBar:FTabBar;
      
      private var rankingList:FList;
      
      private var listScroll:FVScorllBar;
      
      private var listRegulation:FTextArea;
      
      private var regulationScroll:FVScorllBar;
      
      private var playerList:PlayerRankingListCanvas;
      
      private var rideList:RideRankingListCanvas;
      
      private var keyInput:FTextInput;
      
      private var searchBtn:SmallButton;
      
      private var totalCanvas:RankingListTotalCanvas;
      
      private var totalBtn:SmallButton;
      
      private var _sameLevelStr:String;
      
      private var _sameTypeStr:String;
      
      private var _riverLakeStr:String;
      
      public function RankingListPanel()
      {
         var img:Bitmap;
         var fb:FLabel;
         var rankingXml:XML;
         var searchBg:F9GridBitmap;
         var $mask:Sprite;
         var v:Vector.<Bitmap> = null;
         this._sameLevelStr = LanResManager.getLanTextWords(this,"同级榜");
         this._sameTypeStr = LanResManager.getLanTextWords(this,"同类榜");
         this._riverLakeStr = LanResManager.getLanTextWords(this,"江湖榜");
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 578;
         height = 373;
         titleText = LanResManager.getLanCommonTextWords("排行榜");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.ranklist.ui";
         addChild(img);
         img.x = 10;
         v = new Vector.<Bitmap>();
         v.push(img);
         DynamicManageImages = v;
         fb = new FLabel();
         with(fb)
         {
            x = 356;
            y = 4;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,0);
         }
         addChild(fb);
         this.rankingList = new FList();
         this.rankingList.skin = "list";
         this.rankingList.itemRenderer = new RankingListsRanader();
         this.rankingList.listWidth = 100;
         this.rankingList.listHeight = 146;
         addChild(this.rankingList);
         this.rankingList.x = 13;
         this.rankingList.y = 23;
         rankingXml = <list>
									<node label={LanResManager.getLanCommonTextWords("战斗力排行榜")} id="15"/>
									<node label={LanResManager.getLanCommonTextWords("跨服战斗榜")} id="16"/>
									<node label={LanResManager.getLanCommonTextWords("等级排行榜")} id="1"/>
									<node label={LanResManager.getLanCommonTextWords("财富排行榜")} id="2"/>
									<node label={LanResManager.getLanCommonTextWords("坐骑身价榜")} id="3"/>
									<node label={LanResManager.getLanCommonTextWords("连斩次数榜")} id="4"/>
									<node label={LanResManager.getLanCommonTextWords("BOSS击杀榜")} id="5"/>
									<node label={LanResManager.getLanCommonTextWords("武功境界榜")} id="7"/>
									<node label={LanResManager.getLanCommonTextWords("经脉进度榜")} id="8"/>
									<node label={LanResManager.getLanCommonTextWords("成就进度榜")} id="9"/>
									<node label={LanResManager.getLanCommonTextWords("暗器修炼榜")} id="10"/>
									<node label={LanResManager.getLanCommonTextWords("论剑声望榜")} id="11"/>
									<node label={LanResManager.getLanCommonTextWords("城战排行榜")} id="12"/>
								</list>;
         this.rankingList.dataProvider = rankingXml;
         this.rankingList.setSelectItemByIndex(0);
         this.rankingList.addEventListener(MouseEvent.CLICK,this.onList);
         this.listScroll = new FVScorllBar(this.rankingList,146);
         addChild(this.listScroll);
         this.listScroll.x = 113;
         this.listScroll.y = 23;
         this.listRegulation = new FTextArea();
         with(this.listRegulation)
         {
            x = 22;
            y = 210;
            width = 100;
            height = 115;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("该榜收录战斗力最强的前100名玩家，每日6点会更新重排");
         }
         addChild(this.listRegulation);
         searchBg = Tools.get9GridBitmpByName("inputBg");
         searchBg.width = 88;
         addChild(searchBg);
         searchBg.x = 12;
         searchBg.y = 306;
         this.keyInput = new FTextInput();
         this.keyInput.x = 16;
         this.keyInput.y = 306;
         this.keyInput.height = 20;
         this.keyInput.textColor = StaticValue.WHITE;
         this.keyInput.text = LanResManager.getLanTextWords(this,"支持模糊搜索");
         addChild(this.keyInput);
         this.keyInput.addEventListener(FocusEvent.FOCUS_IN,this.onFocus);
         this.keyInput.addEventListener(FocusEvent.FOCUS_OUT,this.onFocus);
         this.searchBtn = new SmallButton();
         this.searchBtn.label = LanResManager.getLanCommonTextWords("搜");
         addChild(this.searchBtn);
         this.searchBtn.x = 104;
         this.searchBtn.y = 306;
         this.searchBtn.addEventListener(MouseEvent.CLICK,this.onSearch);
         this.rideList = new RideRankingListCanvas();
         this.rideList.$parent = this;
         this.rideList.visible = false;
         addChild(this.rideList);
         this.rideList.x = 135;
         this.rideList.y = 22;
         v.push(this.rideList.bgImg);
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanTextWords(this,"江湖榜"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 135;
         this.tabBar.y = 2;
         this.playerList = new PlayerRankingListCanvas();
         this.playerList.$parent = this;
         this.playerList.visible = false;
         addChild(this.playerList);
         this.playerList.x = 135;
         this.playerList.y = 22;
         v.push(this.playerList.bgImg);
         this.totalCanvas = new RankingListTotalCanvas();
         addChild(this.totalCanvas);
         this.totalCanvas.x = 135;
         this.totalCanvas.y = 300;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 135;
         $mask.y = 22 - 5;
         with($mask.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,434,278);
            endFill();
         }
         this.totalCanvas.mask = $mask;
         this.totalBtn = new SmallButton();
         this.totalBtn.label = LanResManager.getLanTextWords(this,"统计");
         addChild(this.totalBtn);
         this.totalBtn.y = 306;
         this.totalBtn.x = 136;
         this.totalBtn.addEventListener(MouseEvent.CLICK,this.onChangeTotalCanvas);
      }
      
      public function getKeyInputText() : String
      {
         return this.keyInput.text;
      }
      
      private function onChangeTotalCanvas(param1:MouseEvent) : void
      {
         if(this.totalCanvas.y == 22)
         {
            TweenMax.to(this.totalCanvas,1,{"y":300});
         }
         else if(this.totalCanvas.y == 300)
         {
            TweenMax.to(this.totalCanvas,1,{"y":22});
         }
      }
      
      private function onFocus(param1:FocusEvent) : void
      {
         switch(param1.type)
         {
            case FocusEvent.FOCUS_IN:
               if(this.keyInput.text == LanResManager.getLanTextWords(this,"支持模糊搜索"))
               {
                  this.keyInput.text = "";
               }
               break;
            case FocusEvent.FOCUS_OUT:
               if(this.keyInput.text == "")
               {
                  this.keyInput.text = LanResManager.getLanTextWords(this,"支持模糊搜索");
               }
         }
      }
      
      private function onSearch(param1:MouseEvent) : void
      {
         if(this.keyInput.text == "" || this.keyInput.text == LanResManager.getLanTextWords(this,"支持模糊搜索"))
         {
            FAlert.show(LanResManager.getLanTextWords(this,"请输入搜索内容"));
            return;
         }
         dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SEARCH_BTN_CLICK,"",this.keyInput.text));
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanTextWords(this,"江湖榜"):
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,1));
               if(this.rankingList.selectItem.id == "3")
               {
                  this.playerList.visible = false;
                  this.rideList.visible = true;
               }
               else
               {
                  this.playerList.visible = true;
                  this.rideList.visible = false;
               }
               this.listRegulation.text = LanResManager.getLanTextWords(this,int(this.rankingList.selectItem.id) + 2);
               if(int(this.rankingList.selectItem.id) == 15)
               {
                  this.listRegulation.text = LanResManager.getLanCommonTextWords("该榜收录战斗力最强的前100名玩家，每日6点会更新重排");
               }
               break;
            case this._sameLevelStr:
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,2));
               this.playerList.visible = true;
               this.rideList.visible = false;
               switch(int(this.rankingList.selectItem.id))
               {
                  case 2:
                     this.listRegulation.text = LanResManager.getLanTextWords(this,113);
               }
               this.listRegulation.text = LanResManager.getLanTextWords(this,int(this.rankingList.selectItem.id) + 111);
               break;
            case LanResManager.getLanTextWords(this,"同类榜"):
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,2));
               this.playerList.visible = false;
               this.rideList.visible = true;
               this.listRegulation.text = LanResManager.getLanCommonTextWords("该榜收录与您当前骑乘的坐骑同类型的坐骑中身价最高的前100匹坐骑");
         }
         if(this.totalCanvas.y == 22)
         {
            TweenMax.to(this.totalCanvas,1,{"y":300});
         }
      }
      
      private function onList(param1:MouseEvent = null) : void
      {
         switch(int(this.rankingList.selectItem.id))
         {
            case 1:
               if(this.tabBar.getButtonByLabel(this._sameLevelStr))
               {
                  this.tabBar.subButtonByLabel(this._sameLevelStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameTypeStr))
               {
                  this.tabBar.subButtonByLabel(this._sameTypeStr);
               }
               this.listRegulation.text = LanResManager.getLanTextWords(this,3);
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = true;
               this.rideList.visible = false;
               break;
            case 3:
               if(this.tabBar.getButtonByLabel(this._sameLevelStr))
               {
                  this.tabBar.subButtonByLabel(this._sameLevelStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameTypeStr) == null)
               {
                  this.tabBar.addButton(this._sameTypeStr,this.onTabClick);
               }
               this.listRegulation.text = LanResManager.getLanTextWords(this,5);
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = false;
               this.rideList.visible = true;
               break;
            case 2:
               if(this.tabBar.getButtonByLabel(this._sameTypeStr))
               {
                  this.tabBar.subButtonByLabel(this._sameTypeStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameLevelStr) == null)
               {
                  this.tabBar.addButton(this._sameLevelStr,this.onTabClick);
               }
               this.listRegulation.text = LanResManager.getLanTextWords(this,4);
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = true;
               this.rideList.visible = false;
               break;
            case 4:
               if(this.tabBar.getButtonByLabel(this._sameTypeStr))
               {
                  this.tabBar.subButtonByLabel(this._sameTypeStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameLevelStr) == null)
               {
                  this.tabBar.addButton(this._sameLevelStr,this.onTabClick);
               }
               this.listRegulation.text = LanResManager.getLanTextWords(this,6);
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = true;
               this.rideList.visible = false;
               break;
            case 5:
               if(this.tabBar.getButtonByLabel(this._sameTypeStr))
               {
                  this.tabBar.subButtonByLabel(this._sameTypeStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameLevelStr) == null)
               {
                  this.tabBar.addButton(this._sameLevelStr,this.onTabClick);
               }
               this.listRegulation.text = LanResManager.getLanTextWords(this,7);
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = true;
               this.rideList.visible = false;
               break;
            case 6:
               if(this.tabBar.getButtonByLabel(this._sameTypeStr))
               {
                  this.tabBar.subButtonByLabel(this._sameTypeStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameLevelStr) == null)
               {
                  this.tabBar.addButton(this._sameLevelStr,this.onTabClick);
               }
               this.listRegulation.text = LanResManager.getLanTextWords(this,8);
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = true;
               this.rideList.visible = false;
               break;
            case 7:
               if(this.tabBar.getButtonByLabel(this._sameTypeStr))
               {
                  this.tabBar.subButtonByLabel(this._sameTypeStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameLevelStr) == null)
               {
                  this.tabBar.addButton(this._sameLevelStr,this.onTabClick);
               }
               this.listRegulation.text = LanResManager.getLanTextWords(this,9);
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = true;
               this.rideList.visible = false;
               break;
            case 8:
               if(this.tabBar.getButtonByLabel(this._sameTypeStr))
               {
                  this.tabBar.subButtonByLabel(this._sameTypeStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameLevelStr) == null)
               {
                  this.tabBar.addButton(this._sameLevelStr,this.onTabClick);
               }
               this.listRegulation.text = LanResManager.getLanTextWords(this,10);
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = true;
               this.rideList.visible = false;
               break;
            case 9:
               if(this.tabBar.getButtonByLabel(this._sameTypeStr))
               {
                  this.tabBar.subButtonByLabel(this._sameTypeStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameLevelStr) == null)
               {
                  this.tabBar.addButton(this._sameLevelStr,this.onTabClick);
               }
               this.listRegulation.text = LanResManager.getLanTextWords(this,11);
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = true;
               this.rideList.visible = false;
               break;
            case 10:
               if(this.tabBar.getButtonByLabel(this._sameTypeStr))
               {
                  this.tabBar.subButtonByLabel(this._sameTypeStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameLevelStr) == null)
               {
                  this.tabBar.addButton(this._sameLevelStr,this.onTabClick);
               }
               this.listRegulation.text = LanResManager.getLanTextWords(this,12);
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = true;
               this.rideList.visible = false;
               break;
            case 11:
               if(this.tabBar.getButtonByLabel(this._sameTypeStr))
               {
                  this.tabBar.subButtonByLabel(this._sameTypeStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameLevelStr) == null)
               {
                  this.tabBar.addButton(this._sameLevelStr,this.onTabClick);
               }
               this.listRegulation.text = LanResManager.getLanCommonTextWords("该榜收录论剑声望最高的前100名玩家，每周一0点会清空重排");
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = true;
               this.rideList.visible = false;
               break;
            case 12:
               if(this.tabBar.getButtonByLabel(this._sameTypeStr))
               {
                  this.tabBar.subButtonByLabel(this._sameTypeStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameLevelStr) == null)
               {
                  this.tabBar.addButton(this._sameLevelStr,this.onTabClick);
               }
               this.listRegulation.text = LanResManager.getLanCommonTextWords("该榜收录城战最强的前100名玩家，每周一0点会清空重排");
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = true;
               this.rideList.visible = false;
               break;
            case 15:
               if(this.tabBar.getButtonByLabel(this._sameTypeStr))
               {
                  this.tabBar.subButtonByLabel(this._sameTypeStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameLevelStr))
               {
                  this.tabBar.subButtonByLabel(this._sameLevelStr);
               }
               this.listRegulation.text = LanResManager.getLanCommonTextWords("该榜收录战斗力最强的前100名玩家，每日6点会更新重排");
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = true;
               this.rideList.visible = false;
               break;
            case 16:
               if(this.tabBar.getButtonByLabel(this._sameTypeStr))
               {
                  this.tabBar.subButtonByLabel(this._sameTypeStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameLevelStr))
               {
                  this.tabBar.subButtonByLabel(this._sameLevelStr);
               }
               this.listRegulation.text = LanResManager.getLanCommonTextWords("该榜收录在跨服战斗中击败对手最多的玩家.");
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = true;
               this.rideList.visible = false;
               break;
            case 31:
               if(this.tabBar.getButtonByLabel(this._sameTypeStr))
               {
                  this.tabBar.subButtonByLabel(this._sameTypeStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameLevelStr))
               {
                  this.tabBar.subButtonByLabel(this._sameLevelStr);
               }
               this.listRegulation.text = LanResManager.getLanCommonTextWords("该榜收录在尊荣万宝阁中获得积分最多的玩家.");
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = true;
               this.rideList.visible = false;
               break;
            case 34:
               if(this.tabBar.getButtonByLabel(this._sameTypeStr))
               {
                  this.tabBar.subButtonByLabel(this._sameTypeStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameLevelStr))
               {
                  this.tabBar.subButtonByLabel(this._sameLevelStr);
               }
               this.listRegulation.text = LanResManager.getLanCommonTextWords("该榜收录拥有至尊VIP卡的玩家，击杀等级大于150的玩家所获得功勋值，收录功勋最高前100名玩家。");
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = true;
               this.rideList.visible = false;
               break;
            case 36:
               if(this.tabBar.getButtonByLabel(this._sameTypeStr))
               {
                  this.tabBar.subButtonByLabel(this._sameTypeStr);
               }
               if(this.tabBar.getButtonByLabel(this._sameLevelStr))
               {
                  this.tabBar.subButtonByLabel(this._sameLevelStr);
               }
               this.listRegulation.text = LanResManager.getLanCommonTextWords("该榜收录神圣战斗力最强的前100名玩家，每日6点将更新重排。");
               dispatchEvent(new BaseEvent(UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == this._riverLakeStr ? 1 : 2));
               this.playerList.visible = true;
               this.rideList.visible = false;
         }
         switch(this.tabBar.currentLabel)
         {
            case this._riverLakeStr:
               LanResManager.getLanTextWords(this,int(this.rankingList.selectItem.id) + 2);
               break;
            case this._sameLevelStr:
               switch(int(this.rankingList.selectItem.id))
               {
                  case 2:
                     this.listRegulation.text = LanResManager.getLanTextWords(this,113);
               }
               this.listRegulation.text = LanResManager.getLanTextWords(this,int(this.rankingList.selectItem.id) + 111);
               break;
            case this._sameTypeStr:
               this.listRegulation.text = LanResManager.getLanTextWords(this,23);
         }
         if(this.totalCanvas.y == 22)
         {
            TweenMax.to(this.totalCanvas,1,{"y":300});
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         if(this.totalCanvas.y == 22)
         {
            TweenMax.to(this.totalCanvas,1,{"y":300});
         }
         this.keyInput.text = LanResManager.getLanTextWords(this,"支持模糊搜索");
      }
      
      public function setRankingList(param1:XML, param2:String, param3:int, param4:int, param5:Boolean = false, param6:Boolean = false) : void
      {
         if(this.rideList.visible)
         {
            this.rideList.setList(param1,param2,param3,param4,param5,param6);
         }
         if(this.playerList.visible)
         {
            this.playerList.setList(param1,param2,param3,param4,param5,param6);
         }
      }
      
      public function setAvatar(param1:BitmapData) : void
      {
         this.playerList.avatar = param1;
      }
      
      public function setPlayer(param1:Array, param2:BitmapData, param3:int, param4:int, param5:int, param6:Boolean) : void
      {
         this.playerList.setItem(param1,param2,param3,param4,param5,param6 = true);
      }
      
      public function setICOState(param1:Boolean, param2:int, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int, param9:Boolean, param10:int, param11:Boolean, param12:int, param13:Boolean, param14:int, param15:Boolean, param16:int) : void
      {
         this.playerList.ico.setState(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16);
      }
      
      public function setSiShengShouState(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.playerList.ico.setSiShengShouState(param1,param2,param3,param4);
      }
      
      public function setICOXiantian(param1:Boolean, param2:int, param3:int, param4:int) : void
      {
         this.playerList.ico.setXiantian(param1,param2,param3,param4);
      }
      
      public function setICOHuXinYao(param1:Boolean) : void
      {
         this.playerList.ico.setHuXinYao(param1);
      }
      
      public function setICONiXi(param1:Boolean) : void
      {
         this.playerList.ico.setNiXi(param1);
      }
      
      public function setICOFengHuang(param1:Boolean) : void
      {
         this.playerList.ico.setFengHuang(param1);
      }
      
      public function setICORouti(param1:Boolean) : void
      {
         this.playerList.ico.setRouti(param1);
      }
      
      public function setICOWuhun(param1:int, param2:Boolean, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:Boolean, param9:int) : void
      {
         this.playerList.ico.setWuhun(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setCongBaiAndBiShi(param1:int, param2:int) : void
      {
         this.playerList.setCongBaiAndBiShi(param1,param2);
      }
      
      public function setRideAvatar(param1:BitmapData, param2:int) : void
      {
         this.rideList.setAvatar(param1,param2);
      }
      
      public function setDreamBarPercentage(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int, param8:int, param9:int, param10:int) : void
      {
         this.rideList.setDreamBarPercentage(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
      }
      
      public function setRide(param1:Array, param2:Object, param3:BitmapData, param4:int, param5:String, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int, param15:int, param16:int, param17:int, param18:int, param19:int, param20:Boolean = true) : void
      {
         this.rideList.setItem(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param20,param16,param17,param18,param19);
      }
      
      public function setTitle(param1:Boolean = true, param2:String = "", param3:String = "") : void
      {
         if(this.rideList.visible)
         {
            this.rideList.setTitle(param1,param2,param3);
         }
         if(this.playerList.visible)
         {
            this.playerList.setTitle(param1,param2,param3);
         }
      }
      
      public function setYupei(param1:Goods = null) : void
      {
         this.playerList.setYupei(param1);
      }
      
      public function setFlag(param1:int) : void
      {
         this.playerList.setFlag(param1);
      }
      
      public function clear() : void
      {
         this.setTitle(false);
         this.setRide([],[],null,0,"","",0,0,0,0,0,0,0,0,0,0,0,0,0,false);
         this.setRideAvatar(null,0);
         this.setCongBaiAndBiShi(0,0);
         this.setPlayer([],null,0,0,0,false);
         this.setAvatar(null);
         this.setICOState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
         this.setSiShengShouState(0,0,0,0);
         this.setDreamBarPercentage(1,1,1,1,1,false,0,0,0,0);
         this.setFlag(0);
         this.setYupei();
      }
      
      public function setStatisticsData(param1:Array, param2:Array) : void
      {
         this.totalCanvas.setStatisticsData(param1,param2);
      }
      
      public function setAvaterXY(param1:Boolean, param2:int = 0, param3:int = 0) : void
      {
         this.playerList.setAvaterXY(param1,param2,param3);
      }
   }
}

