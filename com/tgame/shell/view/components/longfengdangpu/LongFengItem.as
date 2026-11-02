package com.tgame.shell.view.components.longfengdangpu
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class LongFengItem extends Sprite
   {
      
      public var data:Object;
      
      private var bg:DisplayObject;
      
      private var kuangHD:DisplayObject;
      
      private var yiYongyou:DisplayObject;
      
      public var good:Goods;
      
      private var item:Bitmap;
      
      private var names:FTextArea;
      
      private var price:FTextArea;
      
      private var tf:TextFormat;
      
      private var tf2:TextFormat;
      
      private var gouMaiButton:SmallButton;
      
      private var gouMaiButton2:SmallButton;
      
      public var $parent:DisplayObject;
      
      public function LongFengItem(param1:Object = null)
      {
         var newHD:DisplayObject = null;
         var hotHD:DisplayObject = null;
         var datas:Object = param1;
         super();
         this.data = datas;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/miaoshu_bg.swf");
         this.bg.x = 0;
         this.bg.y = 68;
         addChild(this.bg);
         this.kuangHD = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/item_bg.swf");
         this.kuangHD.x = 38;
         this.kuangHD.y = 0;
         addChild(this.kuangHD);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.tf.size = 14;
         this.tf2 = new TextFormat();
         this.tf2.align = "center";
         this.tf2.size = 11;
         this.good = new Goods(this.data.id);
         this.item = this.good.getSmallICO(65,65);
         this.item.x = 38;
         this.item.y = 0;
         addChild(this.item);
         if(this.data.hot == 1)
         {
            newHD = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/newHD.swf");
            newHD.x = 38;
            newHD.y = 0;
            addChild(newHD);
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               var _loc3_:MovieClip = _loc2_.content as MovieClip;
               _loc3_.x = 30;
               _loc3_.y = -13;
               addChild(_loc3_);
            },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/kuang.swf");
         }
         else if(this.data.hot == 2)
         {
            hotHD = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/hotHD.swf");
            hotHD.x = 38;
            hotHD.y = 0;
            addChild(hotHD);
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               var _loc3_:MovieClip = _loc2_.content as MovieClip;
               _loc3_.x = 30;
               _loc3_.y = -13;
               addChild(_loc3_);
            },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/kuang.swf");
         }
         this.names = new FTextArea();
         this.names.x = this.bg.x;
         this.names.y = this.bg.y + 10;
         this.names.defaultTextFormat = this.tf;
         this.names.textColor = StaticValue.BlUE20;
         this.names.width = 140;
         this.names.height = 20;
         this.names.text = this.good.res.name;
         addChild(this.names);
         this.price = new FTextArea();
         this.price.x = this.bg.x;
         this.price.y = this.bg.y + 27;
         this.price.textColor = StaticValue.YELLOW;
         this.price.defaultTextFormat = this.tf2;
         this.price.width = 140;
         this.price.height = 20;
         this.price.text = LanResManager.getLanCommonTextWords("元宝") + ":" + this.data.price + " - S.L:" + this.data.max;
         addChild(this.price);
         this.gouMaiButton = new SmallButton();
         this.gouMaiButton.width = 60;
         this.gouMaiButton.label = LanResManager.getLanCommonTextWords("购买");
         this.gouMaiButton.x = 50;
         this.gouMaiButton.y = 115;
         addChild(this.gouMaiButton);
         this.gouMaiButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.gouMaiButton2 = new SmallButton();
         this.gouMaiButton2.width = 60;
         this.gouMaiButton2.label = LanResManager.getLanCommonTextWords("礼金");
         this.gouMaiButton2.x = 80;
         this.gouMaiButton2.y = 115;
         this.gouMaiButton2.addEventListener(MouseEvent.CLICK,this.onClick);
         if(this.data.type)
         {
            this.yiYongyou = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/yongyou.swf");
            this.yiYongyou.x = 53;
            this.yiYongyou.y = 34;
            addChild(this.yiYongyou);
         }
      }
      
      private function onIconClick(param1:MouseEvent) : void
      {
         GameInstance.uiInstance.longfengdangpuiPanel.miaoshu.text = this.good.res.desc;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.gouMaiButton:
               this.$parent.dispatchEvent(new BaseEvent(LongFengDangPuPanel.UI_LONGFENGDANGPU_GOUMAI,"",[this.data.id,this.data.price,1,1]));
               break;
            case this.gouMaiButton2:
               this.$parent.dispatchEvent(new BaseEvent(LongFengDangPuPanel.UI_LONGFENGDANGPU_GOUMAI,"",[this.data.id,this.data.price,1,2]));
         }
      }
   }
}

