package com.tgame.shell.view.components.shengxiaotiaozhan
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.manager.PipeManager;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ShenqiDuanzaoPanel extends FPanel
   {
      
      private var bg:DisplayObject;
      
      private var ft:FTextArea;
      
      private var btn:SecondButton;
      
      private var swf:MovieClip;
      
      private var swfSpr:Sprite;
      
      private var swfArr:Object = {};
      
      private var loadUrl1:String = "";
      
      public function ShenqiDuanzaoPanel()
      {
         super();
         width = 420;
         height = 380;
         skin = "panel_btn";
         showCloseButton = true;
         dragAble = true;
         titleText = LanResManager.getLanCommonTextWords("锻造生肖神器");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc1_:FCanvas = null;
         _loc1_ = new FCanvas();
         _loc1_.skin = "box";
         _loc1_.width = 400;
         _loc1_.height = 227;
         _loc1_.x = 10;
         _loc1_.y = 1;
         addChild(_loc1_);
         _loc1_ = new FCanvas();
         _loc1_.skin = "box";
         _loc1_.width = 400;
         _loc1_.height = 80;
         _loc1_.x = 10;
         _loc1_.y = 228;
         addChild(_loc1_);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shiershengxiao/duanzao_bg.swf");
         this.bg.x = 11;
         this.bg.y = 4;
         addChild(this.bg);
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 235;
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("神器现世，风云色变。帝王象征，举世无双。") + "<br>" + LanResManager.getLanCommonTextWords("玩家集齐全套12件十二生肖吉祥碎片后，点击界面下方“锻造”按钮，可以100%锻造成功神器－生肖吉祥（神器）。") + "<br>" + LanResManager.getLanCommonTextWords("注：神器只能佩戴一个，请勿多次锻造，以免浪费。") + "</font>";
         this.ft.width = 385;
         this.ft.height = 90;
         this.ft.wordWrap = true;
         addChild(this.ft);
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("锻造");
         this.btn.x = width / 2 - this.btn.width / 2;
         this.btn.y = 315;
         addChild(this.btn);
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.swfSpr = new Sprite();
         addChild(this.swfSpr);
         this.swfSpr.x = 45;
         this.swfSpr.y = 0;
         this.setSwf();
      }
      
      private function setSwf() : void
      {
         if(this.swf != null)
         {
            this.swf.stop();
            this.swf = null;
         }
         while(this.swfSpr.numChildren > 0)
         {
            this.swfSpr.removeChildAt(0);
         }
         this.loadUrl1 = GameConfig.fileBaseFolder + "res/ui/UIditu/shiershengxiao/jixiang.swf";
         if(this.swfArr["jixiang"] != null)
         {
            this.swf = this.swfArr["jixiang"];
            this.swf.play();
            this.swf.y = -10;
            this.swfSpr.addChild(this.swf);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl1)
               {
                  return;
               }
               if(Boolean(swf) && swf.parent != null)
               {
                  swf.stop();
                  swf.parent.removeChild(swf);
               }
               while(swfSpr.numChildren > 0)
               {
                  swfSpr.removeChildAt(0);
               }
               swf = _loc2_.content as MovieClip;
               swfArr["jixiang"] = swf;
               if(swf)
               {
                  swfSpr.addChild(swf);
               }
            },null,false,this.loadUrl1);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SHENGXIAOWUQIDUANZAO_CLICK);
      }
   }
}

