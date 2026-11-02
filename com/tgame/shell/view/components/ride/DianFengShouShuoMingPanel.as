package com.tgame.shell.view.components.ride
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   
   public class DianFengShouShuoMingPanel extends FPanel
   {
      
      public function DianFengShouShuoMingPanel()
      {
         var _loc1_:FTextArea = null;
         super();
         titleText = LanResManager.getLanCommonTextWords("巅峰兽说明");
         skin = "panel_btn";
         width = 360 - 105 + 83;
         height = 190 + 35 + 30;
         showCloseButton = true;
         dragAble = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = new FTextArea();
         _loc1_.multiline = true;
         _loc1_.wordWrap = true;
         _loc1_.filters = StaticValue.filter;
         _loc1_.width = 280;
         _loc1_.height = 150;
         _loc1_.x = 25 + 5;
         _loc1_.y = 20;
         _loc1_.textColor = StaticValue.ORANGE;
         _loc1_.htmlText = "<font size=\'14\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("巅峰兽坐骑需要集齐九个巅峰兽碎片来激活，部分碎片可在【卧虎藏龙】中使用功勋值兑换。") + LanResManager.getLanCommonTextWords("巅峰兽一共分为九战，每一战将会有不同的属性百分比加成。仇恨值可增加坐骑的战数，通过系统【卧虎藏龙】中可获得仇恨值。") + LanResManager.getLanCommonTextWords("每一个骑乘巅峰兽坐骑的玩家，您将拥有一个独一无二的技能，在战场中将如虎添翼。") + "</font>";
         addChild(_loc1_);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

