package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.shell.view.components.kungfu.KungFuLvCanvas;
   import com.tgame.shell.view.components.ta.TAJianHuKungFuCanvas;
   import com.tgame.shell.view.components.ta.TAOtherKugfuCanvas;
   import com.tgame.shell.view.components.ta.TAPartyKugFuCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import gs.TweenMax;
   
   public class TAKungfuPanel extends FPanel
   {
      
      public static const UI_TA_KUNGFU_PARTY_SHOW:String = "UI_TA_KUNGFU_PARTY_SHOW";
      
      public static const UI_TA_KUNGFU_JIANGHU_SHOW:String = "UI_TA_KUNGFU_JIANGHU_SHOW";
      
      public static const UI_TA_KUNGFU_OTHER_SHOW:String = "UI_TA_KUNGFU_OTHER_SHOW";
      
      private var tabBar:FTabBar;
      
      private var partyKungFu:TAPartyKugFuCanvas;
      
      private var jiangHuKungFu:TAJianHuKungFuCanvas;
      
      private var otherKungFu:TAOtherKugfuCanvas;
      
      private var lvBtn:SmallButton;
      
      private var kungfuLvCanvas:KungFuLvCanvas;
      
      private var lv:int = 0;
      
      public function TAKungfuPanel()
      {
         var v:Vector.<Bitmap>;
         var $mask:Sprite;
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 536;
         height = 459;
         this.titleText = LanResManager.getLanCommonTextWords("武功技能");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.partyKungFu = new TAPartyKugFuCanvas();
         addChild(this.partyKungFu);
         this.partyKungFu.x = 10;
         this.partyKungFu.y = 22;
         this.partyKungFu.visible = false;
         this.jiangHuKungFu = new TAJianHuKungFuCanvas();
         addChild(this.jiangHuKungFu);
         this.jiangHuKungFu.x = 10;
         this.jiangHuKungFu.y = 22;
         this.jiangHuKungFu.visible = false;
         this.otherKungFu = new TAOtherKugfuCanvas();
         addChild(this.otherKungFu);
         this.otherKungFu.x = 10;
         this.otherKungFu.y = 22;
         this.otherKungFu.visible = false;
         v = new Vector.<Bitmap>();
         v.push(this.partyKungFu.bgImg);
         v.push(this.jiangHuKungFu.bgImg);
         v.push(this.otherKungFu.bgImg);
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("TA的门派绝学"),this.onClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("TA的江湖绝学"),this.onClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("TA的其他绝学"),this.onClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.lvBtn = new SmallButton();
         this.lvBtn.label = LanResManager.getLanCommonTextWords("TA的武学境界");
         addChild(this.lvBtn);
         this.lvBtn.visible = false;
         this.lvBtn.x = panelWidth - this.lvBtn.width - 12;
         this.lvBtn.y = 2;
         this.lvBtn.addEventListener(MouseEvent.CLICK,this.onShowLv);
         this.kungfuLvCanvas = new KungFuLvCanvas();
         addChild(this.kungfuLvCanvas);
         this.kungfuLvCanvas.x = 524;
         this.kungfuLvCanvas.y = 24;
         v.push(this.kungfuLvCanvas.bgImg);
         this.DynamicManageImages = v;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 257;
         $mask.y = 24;
         with($mask.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,208,386);
            endFill();
         }
         this.kungfuLvCanvas.mask = $mask;
      }
      
      private function onShowLv(param1:MouseEvent = null) : void
      {
         if(this.kungfuLvCanvas.x == 317)
         {
            TweenMax.to(this.kungfuLvCanvas,1,{"x":524});
         }
         else if(this.kungfuLvCanvas.x == 524)
         {
            TweenMax.to(this.kungfuLvCanvas,1,{"x":317});
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("TA的门派绝学"):
               dispatchEvent(new BaseEvent(UI_TA_KUNGFU_PARTY_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("TA的江湖绝学"):
               dispatchEvent(new BaseEvent(UI_TA_KUNGFU_JIANGHU_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("TA的其他绝学"):
               dispatchEvent(new BaseEvent(UI_TA_KUNGFU_OTHER_SHOW));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         TweenMax.to(this.kungfuLvCanvas,1,{"x":464});
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function showParty() : void
      {
         this.partyKungFu.visible = true;
         this.jiangHuKungFu.visible = false;
         this.otherKungFu.visible = false;
      }
      
      public function setPartyKungfu(param1:Array) : void
      {
         this.partyKungFu.setSkill(param1);
      }
      
      public function showJiangHu() : void
      {
         this.partyKungFu.visible = false;
         this.jiangHuKungFu.visible = true;
         this.otherKungFu.visible = false;
      }
      
      public function setJiangHuKungfu(param1:Array) : void
      {
         this.jiangHuKungFu.setSkill(param1);
      }
      
      public function showOther() : void
      {
         this.partyKungFu.visible = false;
         this.jiangHuKungFu.visible = false;
         this.otherKungFu.visible = true;
      }
      
      public function setOtherKungfu(param1:Array) : void
      {
         this.otherKungFu.setSkill(param1);
      }
      
      public function setKungfuLv(param1:Number) : void
      {
         this.lv = param1;
         if(param1 >= 50)
         {
            this.lvBtn.visible = true;
         }
         else
         {
            this.lvBtn.visible = false;
         }
         this.kungfuLvCanvas.setInitialize(param1);
      }
      
      public function refresh() : void
      {
         switch(this.tabBar.currentLabel)
         {
            case LanResManager.getLanCommonTextWords("门派绝学"):
               this.partyKungFu.refresh();
               break;
            case LanResManager.getLanCommonTextWords("江湖绝学"):
               this.jiangHuKungFu.refresh();
               break;
            case LanResManager.getLanCommonTextWords("其他绝学"):
               this.otherKungFu.refresh();
         }
      }
   }
}

