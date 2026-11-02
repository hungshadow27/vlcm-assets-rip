package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.ridejiaohuanshengshou.jiaoHuanShengShouRideListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class RideJiaohuanMoshouPanel extends FPanel
   {
      
      public static var SEND_RIDE_ID:String = "SEND_RIDE_ID";
      
      public static var RIDE_JIAOHUAN_MOSHOU_BY_CRASH:String = "RIDE_JIAOHUAN_MOSHOU_BY_CRASH";
      
      private var text1:FTextArea;
      
      private var upLevelBtn:SecondButton;
      
      private var _container2:Sprite;
      
      public var rideList:FList;
      
      private var imgIco1:DisplayObject;
      
      private var strIcoMath:String;
      
      private var nameTxt:FTextArea;
      
      private var scroll:FVScorllBar;
      
      private var rideListSelectLabel:String = "-1";
      
      private var tempItem:ItemFace;
      
      public function RideJiaohuanMoshouPanel()
      {
         var v:Vector.<Bitmap>;
         var line:Bitmap;
         var tf:TextFormat;
         var img:Bitmap = null;
         this._container2 = new Sprite();
         super();
         this.width = 397;
         this.height = 277;
         this.dragAble = true;
         this.showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("兽魂碎片进阶");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.ride.zuoqiDuihuan.ui";
         addChild(img);
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         this.text1 = new FTextArea();
         with(this.text1)
         {
            width = 120;
            height = 120;
            x = 15;
            y = 125;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            wordWrap = true;
         }
         addChild(this.text1);
         this.rideList = new FList();
         this.rideList.skin = "list";
         this.rideList.itemRenderer = new jiaoHuanShengShouRideListRender();
         this.rideList.listWidth = 105;
         this.rideList.listHeight = 127;
         addChild(this.rideList);
         this.rideList.x = 11;
         this.rideList.y = 4;
         this.rideList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.scroll = new FVScorllBar(this.rideList,110);
         addChild(this.scroll);
         this.scroll.x = 117;
         this.scroll.y = 3;
         line = StaticValue.getBitmapByClassName("ui.tiem.slot");
         line.x = 45;
         line.y = 33;
         this._container2.addChild(line);
         this.upLevelBtn = new SecondButton();
         this.upLevelBtn.x = 110;
         this.upLevelBtn.y = 41;
         this.upLevelBtn.label = LanResManager.getLanCommonTextWords("兑换");
         this.upLevelBtn.addEventListener(MouseEvent.CLICK,this.onChick);
         this._container2.addChild(this.upLevelBtn);
         this.uplevelButtonEnabled(false);
         this._container2.x = 142;
         this._container2.y = 129;
         this.addChild(this._container2);
         tf = new TextFormat();
         tf.bold = true;
         tf.size = 13;
         this.nameTxt = new FTextArea();
         with(this.nameTxt)
         {
            width = 20;
            height = 140;
            x = 148;
            y = 5;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            wordWrap = true;
         }
         this.addChild(this.nameTxt);
      }
      
      private function onChick(param1:MouseEvent) : void
      {
         this.dispatchEvent(new BaseEvent(RIDE_JIAOHUAN_MOSHOU_BY_CRASH,"",int(this.rideListSelectLabel)));
      }
      
      public function refresh(param1:Boolean, param2:int, param3:int, param4:String, param5:String, param6:int) : void
      {
         var _loc7_:int = 0;
         var _loc8_:Goods = null;
         if(param1)
         {
            this.text1.htmlText = "<textformat leading=\'3\'>" + param5 + "</textformat>";
            _loc7_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(param2,true);
            _loc8_ = new Goods(param2);
            this.setUpLevelGoods(_loc8_,_loc7_ >= param3);
            this.uplevelButtonEnabled(param1);
            this.setAvatar(param6,param4);
         }
      }
      
      public function refreshBlankUI(param1:String) : void
      {
         this.uplevelButtonEnabled(false);
         this.text1.htmlText = "<textformat leading=\'3\'>" + param1 + "</textformat>";
         this.nameTxt.htmlText = "";
         if(this.imgIco1 != null && this.imgIco1.parent != null)
         {
            this.imgIco1.parent.removeChild(this.imgIco1);
         }
         this.strIcoMath = "";
         if(this.tempItem != null && this.tempItem.parent != null)
         {
            this.tempItem.parent.removeChild(this.tempItem);
         }
      }
      
      private function uplevelButtonEnabled(param1:Boolean) : void
      {
         this.upLevelBtn.enabled = param1;
      }
      
      private function onListClick(param1:MouseEvent = null) : void
      {
         if(this.rideList.selectItem == null)
         {
            return;
         }
         if(this.rideList.selectItem.label != "" && this.rideList.selectItem.label != null)
         {
            this.rideListSelectLabel = this.rideList.selectItem.label;
            this.dispatchEvent(new BaseEvent(SEND_RIDE_ID,"",int(this.rideListSelectLabel)));
         }
      }
      
      private function onClose(param1:Event) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setAvatar(param1:int, param2:String) : void
      {
         if(this.strIcoMath == GameConfig.fileBaseFolder + "res/ui/sishenshou/" + param1.toString() + ".png")
         {
            return;
         }
         if(param1 < 1 || param1 > 4)
         {
            if(this.imgIco1 != null && this.imgIco1.parent != null)
            {
               this.imgIco1.parent.removeChild(this.imgIco1);
            }
            return;
         }
         var _loc3_:String = param2;
         _loc3_ = _loc3_.replace(/\(/g,"︵").replace(/\)$/g,"︶");
         _loc3_ = _loc3_.replace(/（/g,"︵").replace(/）$/g,"︶");
         this.nameTxt.htmlText = "<textformat leading=\'3\'>" + _loc3_ + "</textformat>";
         if(this.imgIco1 != null && this.imgIco1.parent != null)
         {
            this.imgIco1.parent.removeChild(this.imgIco1);
         }
         this.strIcoMath = GameConfig.fileBaseFolder + "res/ui/sishenshou/" + param1.toString() + ".png";
         this.imgIco1 = FLoader.startLoad(this.strIcoMath,206,130);
         this.imgIco1.x = 160;
         this.imgIco1.y = 0;
         addChildAt(this.imgIco1,1);
      }
      
      public function setUpLevelGoods(param1:Goods, param2:Boolean) : void
      {
         if(this.tempItem != null && this.tempItem.parent != null)
         {
            this.tempItem.parent.removeChild(this.tempItem);
         }
         this.tempItem = new ItemFace(param1);
         this.tempItem.x = 45 + 2;
         this.tempItem.y = 33 + 2;
         this._container2.addChild(this.tempItem);
         if(!param2)
         {
            this.tempItem.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.tempItem.filters = [];
         }
      }
      
      public function setRideList(param1:XML, param2:int) : void
      {
         this.rideList.dataProvider = param1;
         this.scroll.update();
         if(this.rideList.dataProvider.length > 0)
         {
            this.rideList.setSelectItemByIndex(param2);
            this.rideListSelectLabel = this.rideList.selectItem.label;
         }
         else
         {
            this.rideListSelectLabel = "-1";
         }
      }
   }
}

