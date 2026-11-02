package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YNwangzhezhibangPanel extends FPanel
   {
      
      public static const YN_WZZB_LINGQUZHUANGBEI_CLICK:String = "YN_WZZB_LINGQUZHUANGBEI_CLICK";
      
      private var ftTime:FTextArea;
      
      private var btnSpr:Sprite;
      
      private var goArr:Array = [723563,723574,723585,723596,723607,723618,723629,723640,723651,723662,723673,723684];
      
      public function YNwangzhezhibangPanel()
      {
         super();
         width = 530;
         height = 175;
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("王者之帮");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc3_:int = 0;
         var _loc4_:Bitmap = null;
         var _loc5_:ItemFace = null;
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/ynHuodong/wzzb_bg.swf");
         _loc1_.x = 10;
         _loc1_.y = 0;
         addChild(_loc1_);
         var _loc2_:int = -5;
         _loc3_ = 0;
         while(_loc3_ < 12)
         {
            if(_loc3_ % 2 == 0)
            {
               _loc2_ += 5;
            }
            _loc4_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc4_.x = 13 + 40 * _loc3_ + _loc2_;
            _loc4_.y = 34;
            addChild(_loc4_);
            _loc5_ = new ItemFace(new Goods(this.goArr[_loc3_]));
            _loc5_.x = 15 + 40 * _loc3_ + _loc2_;
            _loc5_.y = 36;
            addChild(_loc5_);
            _loc3_++;
         }
         this.ftTime = new FTextArea();
         this.ftTime.x = 20;
         this.ftTime.y = 115;
         this.ftTime.width = 260;
         addChild(this.ftTime);
         this.btnSpr = new Sprite();
         addChild(this.btnSpr);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(YN_WZZB_LINGQUZHUANGBEI_CLICK));
      }
      
      public function setData(param1:Array, param2:int) : void
      {
         var _loc4_:NewSkinButton = null;
         if(param2 == -1)
         {
            this.ftTime.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("您已在线超过15分钟，可以领奖！") + "</font>";
         }
         else
         {
            this.ftTime.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("您已在线：") + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + int(param2 / 60) + "</font><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("分") + "</font>";
         }
         while(this.btnSpr.numChildren > 0)
         {
            this.btnSpr.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = new NewSkinButton();
            _loc4_.skin = "ynWZZB_LQ_Button";
            _loc4_.x = 15 + 85 * _loc3_;
            _loc4_.y = 77;
            _loc4_.addEventListener(MouseEvent.CLICK,this.onClick);
            _loc4_.enabled = int(param1[_loc3_]) == 1 ? true : false;
            this.btnSpr.addChild(_loc4_);
            _loc3_++;
         }
      }
   }
}

