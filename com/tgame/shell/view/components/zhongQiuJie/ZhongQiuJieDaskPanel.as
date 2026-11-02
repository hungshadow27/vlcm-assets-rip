package com.tgame.shell.view.components.zhongQiuJie
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.MainButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class ZhongQiuJieDaskPanel extends FPanel
   {
      
      public static const UI_ZHONGQIUJIE_DASK_USE:String = "UI_ZHONGQIUJIE_DASK_USE";
      
      public var $parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var okBtn:MainButton;
      
      private var cancelBtn:MainButton;
      
      public function ZhongQiuJieDaskPanel()
      {
         super();
         this.titleText = LanResManager.getLanCommonTextWords("团圆饭桌");
         this.showCloseButton = true;
         this.skin = "panel_btn";
         this.dragAble = true;
         width = 261;
         height = 200 - 20;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.ft = new FTextArea();
         this.ft.htmlText = LanResManager.getLanCommonTextWords("当前桌子宾客数量：");
         this.ft.textColor = StaticValue.GREEN;
         this.ft.filters = StaticValue.filter;
         this.ft.x = 20;
         this.ft.y = 20;
         this.ft.width = 200;
         this.ft.height = this.ft.textHeight + 20;
         addChild(this.ft);
         this.ft1 = new FTextArea();
         this.ft1.text = LanResManager.getLanCommonTextWords("还可以使用数量：");
         this.ft1.textColor = StaticValue.BlUE20;
         this.ft1.filters = StaticValue.filter;
         this.ft1.x = 20;
         this.ft1.y = 40;
         this.ft1.width = 200;
         this.ft1.height = this.ft1.textHeight;
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         this.ft2.text = LanResManager.getLanCommonTextWords("玩家名称");
         this.ft2.textColor = StaticValue.BlUE20;
         this.ft2.filters = StaticValue.filter;
         this.ft2.x = 20;
         this.ft2.y = 60;
         this.ft2.width = 200;
         this.ft2.height = this.ft2.textHeight;
         addChild(this.ft2);
         this.ft3 = new FTextArea();
         this.ft3.text = LanResManager.getLanCommonTextWords("食用时将获得一个月饼。");
         this.ft3.textColor = StaticValue.RED;
         this.ft3.filters = StaticValue.filter;
         this.ft3.x = 20;
         this.ft3.y = 80;
         this.ft3.width = 200;
         this.ft3.height = this.ft3.textHeight;
         addChild(this.ft3);
         this.okBtn = new MainButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("食用");
         this.okBtn.x = 60;
         this.okBtn.y = 115;
         addChild(this.okBtn);
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new MainButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         this.cancelBtn.x = 150;
         this.cancelBtn.y = 115;
         addChild(this.cancelBtn);
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function setPanelData(param1:int, param2:int, param3:String, param4:Boolean) : void
      {
         this.ft.htmlText = LanResManager.getLanCommonTextWords("当前桌子宾客数量：") + param1;
         this.ft1.text = LanResManager.getLanCommonTextWords("还可以使用数量：") + (param2 - param1);
         this.ft2.text = LanResManager.getLanCommonTextWords("所有者：") + param3;
         this.okBtn.enabled = param4;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.okBtn:
               dispatchEvent(new BaseEvent(ZhongQiuJieDaskPanel.UI_ZHONGQIUJIE_DASK_USE));
               this.onClose();
               break;
            case this.cancelBtn:
               this.onClose();
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

