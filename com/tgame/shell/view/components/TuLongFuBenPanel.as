package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   
   public class TuLongFuBenPanel extends FPanel
   {
      
      public static const UI_ZHAOCAIFU_ZHAOCAI_CLICK:String = "UI_ZHAOCAIFU_ZHAOCAI_CLICK";
      
      private var bg1:DisplayObject;
      
      private var tf:TextFormat;
      
      private var cishu:FTextArea;
      
      private var zhaocaiBtn:SecondButton;
      
      private var timer:Timer;
      
      private var mc:MovieClip;
      
      public function TuLongFuBenPanel()
      {
         var loadUrl:String = null;
         var ft:FTextArea = null;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 374 + 450 - 180 - 139 - 216;
         height = 530 - 10 - 87;
         titleText = "屠龙刀";
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/tulongdao/5.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            if(Boolean(mc) && mc.parent != null)
            {
               mc.stop();
               mc.parent.removeChild(mc);
            }
            mc = _loc2_.content as MovieClip;
            mc.x = -50;
            mc.y = -50;
            addChild(mc);
         },null,false,loadUrl);
         ft = new FTextArea();
         ft.wordWrap = true;
         ft.multiline = true;
         ft.filters = StaticValue.filter;
         ft.width = 260;
         ft.height = 57;
         ft.x = 30;
         ft.y = 270 - 5;
         addChild(ft);
         ft.htmlText = "<font size=\'16\' color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("武林至尊,宝刀屠龙,号令天下,") + "<br>" + LanResManager.getLanCommonTextWords("莫敢不从!屠龙在手,谁与争锋?") + "</font>";
         this.cishu = new FTextArea();
         this.cishu.wordWrap = true;
         this.cishu.multiline = true;
         this.cishu.filters = StaticValue.filter;
         this.cishu.defaultTextFormat = this.tf;
         this.cishu.width = 283;
         this.cishu.height = 111;
         this.cishu.x = 5;
         this.cishu.y = 320 - 5;
         addChild(this.cishu);
         this.zhaocaiBtn = new SecondButton();
         this.zhaocaiBtn.label = LanResManager.getLanCommonTextWords("确定");
         this.zhaocaiBtn.x = 120;
         this.zhaocaiBtn.y = 250 + 110;
         addChild(this.zhaocaiBtn);
         this.zhaocaiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.timer = new Timer(10000);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this.setText(1);
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this.timer.stop();
         this.onClose();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.onClose();
      }
      
      public function setText(param1:int) : void
      {
         if(param1 == 1)
         {
            this.cishu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功挑战副本即可激活屠龙刀功法") + "<br>" + LanResManager.getLanCommonTextWords("失败可多次挑战") + "</font>";
         }
         else
         {
            this.cishu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("屠龙刀激活成功") + "</font>";
         }
         this.timer.reset();
         this.timer.start();
      }
   }
}

