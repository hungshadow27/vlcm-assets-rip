package com.tgame.shell.view.components.gift
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.*;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.*;
   
   public class XianShiDaJiangDuiHuanTypeCanvas51 extends Sprite
   {
      
      private var _parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var tubiaoBg:Bitmap;
      
      private var icox:int;
      
      private var icoy:int;
      
      private var btn:SecondButton;
      
      private var obj1:DisplayObject;
      
      private var parm1:int;
      
      private var parm2:int;
      
      private var parm3:int;
      
      private var item:ItemFace;
      
      private var bigICO:Sprite;
      
      private var donghuaH:int = 0;
      
      public function XianShiDaJiangDuiHuanTypeCanvas51()
      {
         super();
      }
      
      public function SetInitialize(param1:int, param2:Array) : int
      {
         var dh:int;
         var path:String = null;
         var $huodongID:int = param1;
         var ar:Array = param2;
         this.parm1 = $huodongID;
         this.parm2 = ar[0];
         dh = int(ar[2][1]);
         if(dh > 0)
         {
            this.bigICO = new Sprite();
            addChild(this.bigICO);
            path = GameConfig.fileBaseFolder + "res/data/mc/donghua/" + dh + ".swf";
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc3_:MovieClip = null;
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.content != null && _loc2_.url.url == path)
               {
                  _loc3_ = _loc2_.content as MovieClip;
                  _loc3_.x = 1;
                  _loc3_.y = 1;
                  _loc3_.width = 296;
                  _loc3_.height = 163;
                  bigICO.addChild(_loc3_);
                  bigICO.y = 0;
                  bigICO.x = 5;
                  donghuaH = 163;
               }
            },null,false,path);
         }
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 5;
            y = dh > 0 ? 163 + 5 : 5;
            wordWrap = true;
            width = 550;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = ar[2][0];
         }
         addChild(this.ft);
         if(this.donghuaH > 0)
         {
            return this.height;
         }
         return this.height + (dh > 0 ? 163 : 0);
      }
   }
}

