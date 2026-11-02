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
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import gs.TweenMax;
   
   public class InstanceTimeRankingPanel extends FPanel
   {
      
      private var tabBar:FTabBar;
      
      private var rankingList:FList;
      
      private var listScroll:FVScorllBar;
      
      private var listRegulation:FTextArea;
      
      private var regulationScroll:FVScorllBar;
      
      private var playerList:PlayerRankingListCanvas;
      
      private var keyInput:FTextInput;
      
      private var searchBtn:SmallButton;
      
      private var totalCanvas:RankingListTotalCanvas;
      
      private var totalBtn:SmallButton;
      
      public function InstanceTimeRankingPanel()
      {
         var img:Bitmap;
         var fb:FLabel;
         var xmlStr:String;
         var xml:XML;
         var searchBg:F9GridBitmap;
         var v:Vector.<Bitmap> = null;
         var $mask:Sprite = null;
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
            text = LanResManager.getLanCommonTextWords("每日凌晨6点更新排行数据");
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
         xmlStr = LanResManager.getLanTextWords(this,"xml赋值副本排行榜名称韩3");
         xml = XML(xmlStr);
         this.rankingList.dataProvider = xml;
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
            text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
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
         this.keyInput.text = LanResManager.getLanCommonTextWords("支持模糊搜索");
         addChild(this.keyInput);
         this.keyInput.addEventListener(FocusEvent.FOCUS_IN,this.onFocus);
         this.keyInput.addEventListener(FocusEvent.FOCUS_OUT,this.onFocus);
         this.searchBtn = new SmallButton();
         this.searchBtn.label = LanResManager.getLanCommonTextWords("搜");
         addChild(this.searchBtn);
         this.searchBtn.x = 104;
         this.searchBtn.y = 306;
         this.searchBtn.addEventListener(MouseEvent.CLICK,this.onSearch);
         this.playerList = new PlayerRankingListCanvas();
         this.playerList.$parent = this;
         addChild(this.playerList);
         this.playerList.x = 135;
         this.playerList.y = 22;
         v.push(this.playerList.bgImg);
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("江湖榜"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("同级榜"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 135;
         this.tabBar.y = 2;
         this.totalCanvas = new RankingListTotalCanvas();
         addChild(this.totalCanvas);
         this.totalCanvas.x = 135;
         this.totalCanvas.y = 300;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 135;
         $mask.y = 22;
         with($mask.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,434,278);
            endFill();
         }
         this.totalCanvas.mask = $mask;
         this.totalBtn = new SmallButton();
         this.totalBtn.label = LanResManager.getLanCommonTextWords("统计");
         addChild(this.totalBtn);
         this.totalBtn.y = 306;
         this.totalBtn.x = 136;
         this.totalBtn.visible = false;
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
               if(this.keyInput.text == LanResManager.getLanCommonTextWords("支持模糊搜索"))
               {
                  this.keyInput.text = "";
               }
               break;
            case FocusEvent.FOCUS_OUT:
               if(this.keyInput.text == "")
               {
                  this.keyInput.text = LanResManager.getLanCommonTextWords("支持模糊搜索");
               }
         }
      }
      
      private function onSearch(param1:MouseEvent) : void
      {
         if(this.keyInput.text == "" || this.keyInput.text == LanResManager.getLanCommonTextWords("支持模糊搜索"))
         {
            FAlert.show(LanResManager.getLanCommonTextWords("请输入搜索内容"));
            return;
         }
         dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_LIST_SEARCH_BTN_CLICK,"",this.keyInput.text));
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("江湖榜"):
               dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,1));
               switch(int(this.rankingList.selectItem.id))
               {
                  case 1:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
                     break;
                  case 2:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
                     break;
                  case 3:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
                     break;
                  case 4:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
                     break;
                  case 5:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
                     break;
                  case 6:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
                     break;
                  case 7:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
               }
               break;
            case LanResManager.getLanCommonTextWords("同级榜"):
               dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,2));
               switch(int(this.rankingList.selectItem.id))
               {
                  case 1:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名与您等级相同的玩家");
                     break;
                  case 2:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名与您等级相同的玩家");
                     break;
                  case 3:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名与您等级相同的玩家");
                     break;
                  case 4:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名与您等级相同的玩家");
                     break;
                  case 5:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名与您等级相同的玩家");
                     break;
                  case 6:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名与您等级相同的玩家");
                     break;
                  case 7:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名与您等级相同的玩家");
               }
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
               this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
               dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == LanResManager.getLanCommonTextWords("江湖榜") ? 1 : 2));
               break;
            case 2:
               this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
               dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == LanResManager.getLanCommonTextWords("江湖榜") ? 1 : 2));
               break;
            case 3:
               this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
               dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == LanResManager.getLanCommonTextWords("江湖榜") ? 1 : 2));
               break;
            case 4:
               this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
               dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == LanResManager.getLanCommonTextWords("江湖榜") ? 1 : 2));
               break;
            case 5:
               this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
               dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == LanResManager.getLanCommonTextWords("江湖榜") ? 1 : 2));
               break;
            case 6:
               this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
               dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == LanResManager.getLanCommonTextWords("江湖榜") ? 1 : 2));
               break;
            case 7:
               this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
               dispatchEvent(new BaseEvent(RankingListPanel.UI_RANKINGLIST_LIST_SHOW,this.rankingList.selectItem.id,this.tabBar.currentLabel == LanResManager.getLanCommonTextWords("江湖榜") ? 1 : 2));
         }
         switch(this.tabBar.currentLabel)
         {
            case LanResManager.getLanCommonTextWords("江湖榜"):
               switch(int(this.rankingList.selectItem.id))
               {
                  case 1:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
                     break;
                  case 2:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
                     break;
                  case 3:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
                     break;
                  case 4:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
                     break;
                  case 5:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
                     break;
                  case 6:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
                     break;
                  case 7:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名20级以上的玩家");
               }
               break;
            case LanResManager.getLanCommonTextWords("同级榜"):
               switch(int(this.rankingList.selectItem.id))
               {
                  case 1:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名与您等级相同的玩家");
                     break;
                  case 2:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名与您等级相同的玩家");
                     break;
                  case 3:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名与您等级相同的玩家");
                     break;
                  case 4:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名与您等级相同的玩家");
                     break;
                  case 5:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名与您等级相同的玩家");
                     break;
                  case 6:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名与您等级相同的玩家");
                     break;
                  case 7:
                     this.listRegulation.text = LanResManager.getLanCommonTextWords("本榜收录单人进入副本，以最快速消灭副本中全部怪物的前100名与您等级相同的玩家");
               }
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
         this.keyInput.text = LanResManager.getLanCommonTextWords("支持模糊搜索");
      }
      
      public function setRankingList(param1:XML, param2:String, param3:int, param4:int, param5:Boolean = false, param6:Boolean = false) : void
      {
         this.playerList.setList(param1,param2,param3,param4,param5,param6);
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
      
      public function setTitle(param1:Boolean = true, param2:String = "", param3:String = "") : void
      {
         this.playerList.setTitle(param1,param2,param3);
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
         this.setCongBaiAndBiShi(0,0);
         this.setPlayer([],null,0,0,0,false);
         this.setAvatar(null);
         this.setICOState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
         this.setSiShengShouState(0,0,0,0);
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

