package com.tgame.shell.view.components.fengzhengjie
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.DisplayObject;
   
   public class ZengSongFengZhengPanel extends FPanel
   {
      
      private var text:FTextArea;
      
      private var ft:FTextArea;
      
      public function ZengSongFengZhengPanel()
      {
         super();
         this.titleText = LanResManager.getLanCommonTextWords("赠送风筝");
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         width = 258;
         height = 216;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         var _loc1_:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/fengzhengjie/bg2.png",240,33);
         _loc1_.x = 10;
         _loc1_.y = 141;
         addChild(_loc1_);
         this.ft = new FTextArea();
         this.ft.htmlText = "<textformat leading=\'2\'>" + "  " + LanResManager.getLanCommonTextWords("秋香姐看着你手中的风筝，眼含秋波,忽然间，她轻轻叹出一口气。轻轻念道：“不知多少年了，也未看到过这样精致的纸鸢”。不知不觉间，秋香脸上多了两道泪痕。") + "<br>" + "   " + LanResManager.getLanCommonTextWords("秋香慢慢抬起头来，对你说道：“明年的今天，你还会送我纸鸢吗？”") + "</textformat>";
         this.ft.textColor = StaticValue.WHITE;
         this.ft.filters = StaticValue.filter;
         this.ft.x = 18;
         this.ft.y = 14;
         this.ft.wordWrap = true;
         this.ft.width = 220;
         this.ft.height = 130;
         addChild(this.ft);
         this.text = new FTextArea();
         this.text.text = LanResManager.getLanCommonTextWords("倾慕值增加：");
         this.text.textColor = StaticValue.GREEN;
         this.text.filters = StaticValue.filter;
         this.text.x = 20;
         this.text.y = 147;
         this.text.width = 240;
         this.text.height = 25;
         addChild(this.text);
      }
      
      public function update(param1:int, param2:int) : void
      {
         if(param1 == 1)
         {
            this.titleText = LanResManager.getLanCommonTextWords("赠送风筝");
            this.text.text = LanResManager.getLanCommonTextWords("倾慕值增加：") + param2;
            this.ft.htmlText = "<textformat leading=\'2\'>" + "  " + LanResManager.getLanCommonTextWords("秋香姐看着你手中的风筝，眼含秋波,忽然间，她轻轻叹出一口气。轻轻念道：“不知多少年了，也未看到过这样精致的纸鸢”。不知不觉间，秋香脸上多了两道泪痕。") + "<br>" + "   " + LanResManager.getLanCommonTextWords("秋香慢慢抬起头来，对你说道：“明年的今天，你还会送我纸鸢吗？”") + "</textformat>";
         }
         else
         {
            this.titleText = LanResManager.getLanCommonTextWords("赠送风灯");
            this.text.text = LanResManager.getLanCommonTextWords("好感度增加：") + param2;
            this.ft.htmlText = "<textformat leading=\'2\'>" + "  " + LanResManager.getLanCommonTextWords("嫦娥看着你手中的风灯，眼含秋波,忽然间，她轻轻叹出一口气。轻轻念道：“不知多少年了，也未看到过这样精致的风灯”。不知不觉间，嫦娥脸上多了两道泪痕。") + "<br>" + "   " + LanResManager.getLanCommonTextWords("嫦娥慢慢抬起头来，对你说道：“明年的今天，你还会送我风灯吗？”") + "</textformat>";
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

