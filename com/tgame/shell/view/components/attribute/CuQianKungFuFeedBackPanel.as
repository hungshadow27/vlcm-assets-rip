package com.tgame.shell.view.components.attribute
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class CuQianKungFuFeedBackPanel extends FPanel
   {
      
      public static const UI_CUQIANKUNGFU_FEEDBACK_PANEL_RECHALLENGE_CLICK:String = "UI_CUQIANKUNGFU_FEEDBACK_PANEL_RECHALLENGE_CLICK";
      
      public var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var fta:FTextArea;
      
      private var ftayb:FTextArea;
      
      private var ftajp:FTextArea;
      
      private var ftacz:FTextArea;
      
      private var ftatl:FTextArea;
      
      private var img:DisplayObject;
      
      private var objImg:Object = {};
      
      public function CuQianKungFuFeedBackPanel()
      {
         super();
         skin = "sceondPanel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 289;
         height = 235;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.fta = new FTextArea();
         this.fta.filters = StaticValue.filter;
         this.fta.x = 115;
         this.fta.y = 93;
         this.fta.textColor = StaticValue.WHITE;
         this.fta.width = 55;
         addChild(this.fta);
         this.ftayb = new FTextArea();
         this.ftayb.x = 10 + 18;
         this.ftayb.y = 130;
         this.ftayb.textColor = StaticValue.WHITE;
         this.ftayb.width = 140;
         this.ftayb.htmlText = LanResManager.getLanCommonTextWords("支付押金：");
         addChild(this.ftayb);
         this.ftajp = new FTextArea();
         this.ftajp.x = 135 + 18;
         this.ftajp.y = 130;
         this.ftajp.textColor = StaticValue.WHITE;
         this.ftajp.width = 140;
         this.ftajp.htmlText = LanResManager.getLanCommonTextWords("获得金票：");
         this.ftacz = new FTextArea();
         this.ftacz.x = 10 + 18;
         this.ftacz.y = 150;
         this.ftacz.textColor = StaticValue.WHITE;
         this.ftacz.width = 140;
         this.ftacz.htmlText = LanResManager.getLanCommonTextWords("成长增加：");
         addChild(this.ftacz);
         this.ftatl = new FTextArea();
         this.ftatl.x = 135 + 18 + 20;
         this.ftatl.y = 150;
         this.ftatl.textColor = StaticValue.WHITE;
         this.ftatl.width = 140;
         this.ftatl.htmlText = LanResManager.getLanCommonTextWords("剩余体力：");
         addChild(this.ftatl);
         this.okBtn = new SecondButton();
         addChild(this.okBtn);
         this.okBtn.label = LanResManager.getLanCommonTextWords("再次挑战");
         this.okBtn.x = 54;
         this.okBtn.y = 180;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         addChild(this.cancelBtn);
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         this.cancelBtn.width = this.okBtn.width;
         this.cancelBtn.paddingLeft = 12;
         this.cancelBtn.x = 174;
         this.cancelBtn.y = 180;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function setDatas(param1:Boolean, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:String = null;
         if(this.img != null && this.img.parent != null)
         {
            this.img.parent.removeChild(this.img);
         }
         if(this.objImg[param1 ? 1 : 0] != null)
         {
            this.img = this.objImg[param1 ? 1 : 0];
         }
         else
         {
            _loc6_ = GameConfig.fileBaseFolder + "res/ui/cuqiankungfu/" + (param1 ? "success" : "failure") + ".png";
            this.img = FLoader.startLoad(_loc6_,277,174);
            this.objImg[param1 ? 1 : 0] = this.img;
         }
         this.img.x = 6;
         this.img.y = 0;
         addChild(this.img);
         this.fta.htmlText = param1 ? LanResManager.getLanCommonTextWords("挑战成功") : LanResManager.getLanCommonTextWords("挑战失败");
         this.ftayb.htmlText = LanResManager.getLanCommonTextWords("支付押金：") + param2 + LanResManager.getLanCommonTextWords("元宝");
         this.ftajp.htmlText = LanResManager.getLanCommonTextWords("获得金票：") + param3;
         this.ftacz.htmlText = LanResManager.getLanCommonTextWords("成长增加：") + param4;
         this.ftatl.htmlText = LanResManager.getLanCommonTextWords("剩余体力：") + param5;
      }
      
      public function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               if(parent != null)
               {
                  this.parent.removeChild(this);
               }
               this.dispatchEvent(new BaseEvent(UI_CUQIANKUNGFU_FEEDBACK_PANEL_RECHALLENGE_CLICK));
               break;
            case this.cancelBtn:
               if(parent != null)
               {
                  this.parent.removeChild(this);
               }
         }
      }
   }
}

