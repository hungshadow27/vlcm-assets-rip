package com.tgame.shell.view.components.MeiRen
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.shell.view.components.MeiRenPanel;
   import com.zcp.common.cd.CDFace;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class MeiRenList extends FListCellRenderer
   {
      
      public static var ChuZhan0:SecondButton;
      
      public static var $parent:DisplayObject;
      
      private static var mrid:int = 0;
      
      private static var ar:Array = [];
      
      private var tf:TextFormat;
      
      private var TouXiang:Bitmap;
      
      private var MeirenMingcheng:FTextArea;
      
      private var sp1:Sprite;
      
      private var shuzi:int = 0;
      
      private var btnShow:int = 0;
      
      private var headContainer:Sprite;
      
      private var headImg:Bitmap;
      
      private var head:String = "";
      
      private var gongImgObj:Object = {};
      
      private var gongImg:DisplayObject;
      
      private var zhantu:ItemFace;
      
      private var Zhan:DisplayObject;
      
      private var btn:FSimpleButton;
      
      public function MeiRenList()
      {
         super();
      }
      
      public static function GetColor(param1:int) : int
      {
         var _loc2_:int = -1;
         switch(param1)
         {
            case 1:
               _loc2_ = StaticValue.WHITE;
               break;
            case 2:
               _loc2_ = StaticValue.BLUE;
               break;
            case 3:
               _loc2_ = StaticValue.GREEN;
               break;
            case 4:
               _loc2_ = StaticValue.PURPLE;
               break;
            case 5:
               _loc2_ = StaticValue.ORANGE;
         }
         return _loc2_;
      }
      
      override public function initUI() : void
      {
         var _loc3_:CDFace = null;
         _height = 52;
         this.tf = new TextFormat();
         this.tf.align = "left";
         mrid = data.id;
         ar[data.index] = data.id;
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/meiren/head.swf");
         _loc1_.visible = true;
         _loc1_.x = 10;
         _loc1_.y = 4;
         addChild(_loc1_);
         var _loc2_:Bitmap = ResPathManager.getSmallICO(data.headImg);
         _loc2_.x = 15;
         _loc2_.y = 8;
         addChild(_loc2_);
         if(data.maxTime != 0 && data.time != 0)
         {
            _loc3_ = new CDFace(35,35);
            _loc3_.x = 15;
            _loc3_.y = 8;
            addChild(_loc3_);
            _loc3_.play(data.maxTime,data.maxTime - data.time);
         }
         this.MeirenMingcheng = new FTextArea();
         addChild(this.MeirenMingcheng);
         this.MeirenMingcheng.multiline = true;
         this.MeirenMingcheng.autoSize = TextFieldAutoSize.LEFT;
         this.MeirenMingcheng.wordWrap = true;
         this.MeirenMingcheng.width = 690;
         this.MeirenMingcheng.height = 200;
         this.MeirenMingcheng.x = 50;
         this.MeirenMingcheng.y = 11;
         this.MeirenMingcheng.textColor = GetColor(data.color);
         this.MeirenMingcheng.htmlText = "<font > " + data.name + " </font>";
         this.Zhan = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/meiren/zhan.swf");
         this.Zhan.x = 100 + 26;
         this.Zhan.y = 27;
         addChild(this.Zhan);
         if(data.state == "1")
         {
            this.Zhan.visible = true;
         }
         else
         {
            this.Zhan.visible = false;
         }
         this.btn = new FSimpleButton();
         addChild(this.btn);
         this.btn.x = 105;
         this.btn.y = 27;
         this.btn.name = "btn";
         this.btn.visible = false;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function ChuZhanFun(param1:MouseEvent) : void
      {
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         $parent.dispatchEvent(new BaseEvent(MeiRenPanel.UI_MeiRenPanel_CHUZHAN_CLICK,"",[data.id,data.state,data.index],"btn"));
      }
      
      public function showChuzhanBtn(param1:Boolean, param2:int) : void
      {
         if(param2 == 1)
         {
            this.btn.skin = "mrxiuxiButton";
         }
         else if(param2 == 2)
         {
            this.btn.skin = "mrchuzhanButton";
         }
         this.btn.visible = param1;
      }
      
      public function showZhan(param1:Boolean) : void
      {
         if(param1)
         {
            this.Zhan.visible = true;
         }
         else
         {
            this.Zhan.visible = false;
         }
      }
      
      public function reMid() : int
      {
         return int(data.id);
      }
      
      public function reState() : int
      {
         return int(data.state);
      }
   }
}

