package com.tgame.shell.view.components.attribute
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.NoticeManager;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   
   public class DiZiGongXian extends FPanel
   {
      
      public var nameInput:FTextInput;
      
      private var nameBg:F9GridBitmap;
      
      private var okBtn:SmallButton;
      
      public var $parent:DisplayObject;
      
      private var miaoshu:FTextArea;
      
      public function DiZiGongXian()
      {
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 220 + 20 + 10;
         height = 160 + 20;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         titleText = LanResManager.getLanCommonTextWords("弟子贡献");
         this.nameBg = Tools.get9GridBitmpByName("countBg");
         addChild(this.nameBg);
         this.nameBg.width = 150;
         this.nameBg.x = 19 + 15 + 10 + 5;
         this.nameBg.y = 29 + 3;
         this.miaoshu = new FTextArea();
         this.miaoshu.x = 25 - 10;
         this.miaoshu.y = 10;
         this.miaoshu.width = 200 + 20;
         this.miaoshu.filters = StaticValue.filter;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("请输入要贡献的金额") + "<br><br><br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("注：贡献的多少将影响弟子的属性，贡献") + "<br>" + LanResManager.getLanCommonTextWords("每天0点会发生变化，且弟子贡献加成属") + "<br>" + LanResManager.getLanCommonTextWords("性每天0点固定下降极少量属性数值。") + "</font>";
         addChild(this.miaoshu);
         this.nameInput = new FTextInput();
         addChild(this.nameInput);
         this.nameInput.width = 140;
         this.nameInput.x = 20 + 15 + 10 + 5;
         this.nameInput.y = 30 + 3;
         this.nameInput.text = LanResManager.getLanCommonTextWords("输入注入的金票/元宝");
         this.nameInput.defaultTextFormat = StaticValue.format;
         this.nameInput.filters = StaticValue.filter;
         this.nameInput.textColor = StaticValue.BLUE;
         this.nameInput.restrict = "0-9";
         this.nameInput.addEventListener(FocusEvent.FOCUS_IN,this.onFocus);
         this.nameInput.addEventListener(FocusEvent.FOCUS_OUT,this.onFocus);
         this.okBtn = new SmallButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 90 + 10 + 5;
         this.okBtn.y = 90 + 3 + 20;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function onClose(param1:* = null) : void
      {
         if(this != null && this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onFocus(param1:FocusEvent) : void
      {
         if(param1.type == FocusEvent.FOCUS_IN)
         {
            switch(param1.target)
            {
               case this.nameInput:
                  this.nameInput.text = "";
            }
         }
         else if(param1.type == FocusEvent.FOCUS_OUT)
         {
            switch(param1.target)
            {
               case this.nameInput:
                  if(this.nameInput.text == "")
                  {
                     this.nameInput.text = LanResManager.getLanCommonTextWords("输入注入的金票/元宝");
                  }
            }
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.nameInput.text == "")
         {
            NoticeManager.notify(NoticeManager.FOOT,"请输入注入的金票/元宝");
            return;
         }
         if(parseInt(this.nameInput.text) < 2000)
         {
            NoticeManager.notify(NoticeManager.FOOT,"贡献的最小额度为2000");
            return;
         }
         if(isNaN(parseInt(this.nameInput.text)))
         {
            NoticeManager.notify(NoticeManager.FOOT,"请输入数字");
            return;
         }
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDEMENPAI_GONGXIAN_OK_CLICK,"",this.nameInput.text));
         this.onClose();
      }
   }
}

