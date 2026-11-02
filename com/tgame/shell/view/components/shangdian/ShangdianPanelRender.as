package com.tgame.shell.view.components.shangdian
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class ShangdianPanelRender extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var boxContainer:Sprite;
      
      private var bg3:DisplayObject;
      
      private var index:int;
      
      private var type:int;
      
      public function ShangdianPanelRender()
      {
         super();
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/shangdian/kuang2.swf");
         _loc1_.x = 100 - 69 >> 1;
         addChild(_loc1_);
         var _loc2_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/shangdian/btn/bg.swf");
         _loc2_.x = 6;
         _loc2_.y = 73;
         addChild(_loc2_);
         this.boxContainer = new Sprite();
         addChild(this.boxContainer);
      }
      
      public function setData(param1:Object, param2:int = 0) : void
      {
         var goods:Goods;
         var tf:TextFormat;
         var button:NewSkinButton;
         var itemFace:ItemFace = null;
         var txtPrice:FTextArea = null;
         var newHD:DisplayObject = null;
         var hotHD:DisplayObject = null;
         var data:Object = param1;
         var _type:int = param2;
         this.type = _type;
         goods = new Goods(data.goodsID);
         goods.count = data.goodsNum;
         itemFace = new ItemFace(goods,65,65);
         itemFace.x = 100 - 65 >> 1;
         itemFace.y = 2;
         this.boxContainer.addChild(itemFace);
         txtPrice = new FTextArea();
         txtPrice.width = 100;
         txtPrice.y = 73;
         tf = new TextFormat();
         tf.align = "center";
         txtPrice.defaultTextFormat = tf;
         txtPrice.textColor = StaticValue.YELLOW;
         txtPrice.filters = StaticValue.filter;
         txtPrice.mouseEnabled = false;
         txtPrice.text = LanResManager.getLanCommonTextWords("价格：") + data.price + LanResManager.getLanCommonTextWords("积分");
         this.boxContainer.addChild(txtPrice);
         button = new NewSkinButton();
         button.skin = "shangdiangoumaiBtn";
         button.name = data.index;
         button.x = 100 - button.width >> 1;
         button.y = 87;
         this.index = data.index;
         this.boxContainer.addChild(button);
         button.addEventListener(MouseEvent.CLICK,this.onClickButtonHandler);
         if(data.hot == 1)
         {
            newHD = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/newHD.swf");
            newHD.x = 17;
            newHD.y = 2;
            addChild(newHD);
            (newHD as Sprite).mouseEnabled = false;
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               var _loc3_:MovieClip = _loc2_.content as MovieClip;
               _loc3_.x = 10;
               _loc3_.y = -11;
               addChild(_loc3_);
            },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/kuang.swf");
         }
         else if(data.hot == 2)
         {
            hotHD = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/hotHD.swf");
            hotHD.x = 17;
            hotHD.y = 2;
            addChild(hotHD);
            (hotHD as Sprite).mouseEnabled = false;
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               var _loc3_:MovieClip = _loc2_.content as MovieClip;
               _loc3_.x = 10;
               _loc3_.y = -11;
               addChild(_loc3_);
            },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/kuang.swf");
         }
      }
      
      private function onClickButtonHandler(param1:MouseEvent) : void
      {
         var evt:MouseEvent = param1;
         FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
         FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
         FAlert.show(LanResManager.getLanCommonTextWords("确定购买"),"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               $parent.dispatchEvent(new BaseEvent(ZhenpinShangdianPanel.GOUMAI_CLICK,"",[type,index]));
            }
         });
      }
      
      private function removeContainerBoxChildren() : void
      {
         while(this.boxContainer.numChildren > 0)
         {
            this.boxContainer.removeChildAt(0);
         }
      }
   }
}

