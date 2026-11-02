package com.tgame.shell.view.components.zhongQiuJie
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class YuanXiaoJieRankPanel extends FPanel
   {
      
      private var list:FList;
      
      private var nameFta:FTextArea;
      
      private var nameFta1:FTextArea;
      
      private var lingJiangBtn:SecondButton;
      
      private var index:int;
      
      public var $parent:DisplayObject;
      
      public function YuanXiaoJieRankPanel()
      {
         var _loc1_:FTextArea = null;
         super();
         this.titleText = "中奖名单";
         this.showCloseButton = false;
         this.skin = "panel_btn";
         this.dragAble = true;
         width = 220;
         height = 335;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.nameFta = new FTextArea();
         this.nameFta.htmlText = "所有人都可以领奖";
         this.nameFta.textColor = StaticValue.GREEN;
         this.nameFta.filters = StaticValue.filter;
         this.nameFta.x = 50;
         this.nameFta.y = 25;
         this.nameFta.width = 150;
         this.nameFta.height = 300;
         addChild(this.nameFta);
         this.nameFta1 = new FTextArea();
         this.nameFta1.htmlText = "";
         this.nameFta1.textColor = StaticValue.GREEN;
         this.nameFta1.filters = StaticValue.filter;
         this.nameFta1.x = 30 + 90 + 20;
         this.nameFta1.y = 30;
         this.nameFta1.width = 150;
         this.nameFta1.height = 300;
         addChild(this.nameFta1);
         _loc1_ = new FTextArea();
         _loc1_.text = LanResManager.getLanCommonTextWords("排名");
         _loc1_.textColor = StaticValue.BlUE20;
         _loc1_.filters = StaticValue.filter;
         _loc1_.x = 30;
         _loc1_.y = 5;
         _loc1_.width = _loc1_.textWidth + 10;
         _loc1_.height = _loc1_.textHeight;
         _loc1_ = new FTextArea();
         _loc1_.text = LanResManager.getLanCommonTextWords("玩家名称");
         _loc1_.textColor = StaticValue.BlUE20;
         _loc1_.filters = StaticValue.filter;
         _loc1_.x = 105;
         _loc1_.y = 5;
         _loc1_.width = _loc1_.textWidth + 10;
         _loc1_.height = _loc1_.textHeight;
         this.lingJiangBtn = new SecondButton();
         this.lingJiangBtn.label = LanResManager.getLanCommonTextWords("领取");
         this.lingJiangBtn.x = 90;
         this.lingJiangBtn.y = 270;
         addChild(this.lingJiangBtn);
         this.lingJiangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.lingJiangBtn:
               this.$parent.dispatchEvent(new BaseEvent(YuanXiaoJiePanel.UI_RANK_JIANGLI_CLICK,"",this.index));
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function updateRank(param1:int, param2:Array) : void
      {
         this.index = param1;
         this.titleText = "第" + param1 + "期";
         var _loc3_:String = "";
         var _loc4_:String = "";
         var _loc5_:int = 0;
         while(_loc5_ < param2.length)
         {
            _loc3_ += param2[_loc5_] + "<br>";
            _loc5_++;
         }
         this.nameFta.htmlText = "<textformat leading=\'12\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + _loc3_ + "</font>" + "</textformat>";
      }
   }
}

