package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.kungfu.JiangHuKungFuCanvas;
   import com.tgame.shell.view.components.kungfu.KungFuLvCanvas;
   import com.tgame.shell.view.components.kungfu.OtherKungFuCanvas;
   import com.tgame.shell.view.components.kungfu.PartyKungFuCanvas;
   import com.tgame.shell.view.components.kungfu.TianFuKungFuCanvas;
   import com.tgame.shell.view.components.kungfu.WufangKungFuCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import gs.TweenMax;
   
   public class KungFuPanel extends FPanel
   {
      
      public static const UI_KUNGFU_PARTY_SHOW:String = "UI_KUNGFU_PARTY_SHOW";
      
      public static const UI_KUNGFU_JIANGHU_SHOW:String = "UI_KUNGFU_JIANGHU_SHOW";
      
      public static const UI_KUNGFU_OTHER_SHOW:String = "UI_KUNGFU_OTHER_SHOW";
      
      public static const UI_KUNGFU_WUFANG_SHOW:String = "UI_KUNGFU_WUFANG_SHOW";
      
      public static const UI_KUNGFU_TIANFU_SHOW:String = "UI_KUNGFU_TIANFU_SHOW";
      
      public static const UI_KUNGFU_TIANFU_TUPO:String = "UI_KUNGFU_TIANFU_TUPO";
      
      public static const UI_KUNGFU_SKILL_BOOK_COUNT:String = "UI_KUNGFU_SKILL_BOOK_COUNT";
      
      public static const UI_KUNGFU_SKILL_STUDY:String = "UI_KUNGFU_SKILL_STUDY";
      
      public static const UI_KUNGFU_SKILL_UPGRADE:String = "UI_KUNGFU_SKILL_UPGRADE";
      
      public static const UI_KUNGFU_SKILL_TUPO:String = "UI_KUNGFU_SKILL_TUPO";
      
      public static const UI_KUNGFU_SKILL_DRAG_START:String = "UI_KUNGFU_SKILL_DRAG_START";
      
      public static const UI_KUNGFUBREAKTHROUGHPANEL_KSTPCLICK:String = "UI_KUNGFUBREAKTHROUGHPANEL_KSTPCLICK";
      
      private var tabBar:FTabBar;
      
      private var partyKungFu:PartyKungFuCanvas;
      
      private var jiangHuKungFu:JiangHuKungFuCanvas;
      
      private var otherKungFu:OtherKungFuCanvas;
      
      private var wufangCanvas:WufangKungFuCanvas;
      
      private var tianFuCanvas:TianFuKungFuCanvas;
      
      private var lvBtn:SmallButton;
      
      private var kungfuLvCanvas:KungFuLvCanvas;
      
      private var kungfuBreakthrough:KungFuBreakthroughPanel;
      
      private var lv:Number = 0;
      
      private var kuafuMask:Sprite;
      
      private var curCanvas:DisplayObject;
      
      public function KungFuPanel()
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
         this.partyKungFu = new PartyKungFuCanvas();
         this.partyKungFu.$parent = this;
         addChild(this.partyKungFu);
         this.partyKungFu.x = 10;
         this.partyKungFu.y = 22;
         this.partyKungFu.visible = false;
         this.jiangHuKungFu = new JiangHuKungFuCanvas();
         this.jiangHuKungFu.$parent = this;
         addChild(this.jiangHuKungFu);
         this.jiangHuKungFu.x = 10;
         this.jiangHuKungFu.y = 22;
         this.jiangHuKungFu.visible = false;
         this.otherKungFu = new OtherKungFuCanvas();
         this.otherKungFu.$parent = this;
         addChild(this.otherKungFu);
         this.otherKungFu.x = 10;
         this.otherKungFu.y = 22;
         this.otherKungFu.visible = false;
         this.wufangCanvas = new WufangKungFuCanvas();
         addChild(this.wufangCanvas);
         this.wufangCanvas.x = 10;
         this.wufangCanvas.y = 22;
         this.wufangCanvas.visible = false;
         this.tianFuCanvas = new TianFuKungFuCanvas();
         addChild(this.tianFuCanvas);
         this.tianFuCanvas.x = 10;
         this.tianFuCanvas.y = 22;
         this.tianFuCanvas.visible = false;
         v = new Vector.<Bitmap>();
         v.push(this.partyKungFu.bgImg);
         v.push(this.jiangHuKungFu.bgImg);
         v.push(this.otherKungFu.bgImg);
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("门派绝学"),this.onClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("江湖绝学"),this.onClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("其他绝学"),this.onClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("武防"),this.onClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.lvBtn = new SmallButton();
         this.lvBtn.label = LanResManager.getLanCommonTextWords("武学境界");
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
            drawRect(0,0,268,386);
            endFill();
         }
         this.kungfuLvCanvas.mask = $mask;
      }
      
      private function onShowLv(param1:MouseEvent = null) : void
      {
         if(this.kungfuLvCanvas.x == 317)
         {
            TweenMax.to(this.kungfuLvCanvas,1,{
               "x":524,
               "onComplete":this.onCom
            });
         }
         else if(this.kungfuLvCanvas.x == 524)
         {
            TweenMax.to(this.kungfuLvCanvas,1,{
               "x":317,
               "onComplete":this.onCom
            });
         }
      }
      
      private function onCom() : void
      {
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.wufangCanvas.visible = false;
         this.partyKungFu.visible = false;
         this.jiangHuKungFu.visible = false;
         this.otherKungFu.visible = false;
         this.tianFuCanvas.isAuto = false;
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("门派绝学"):
               dispatchEvent(new BaseEvent(UI_KUNGFU_PARTY_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("江湖绝学"):
               dispatchEvent(new BaseEvent(UI_KUNGFU_JIANGHU_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("其他绝学"):
               dispatchEvent(new BaseEvent(UI_KUNGFU_OTHER_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("武防"):
               dispatchEvent(new BaseEvent(UI_KUNGFU_WUFANG_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("天赋"):
               dispatchEvent(new BaseEvent(UI_KUNGFU_TIANFU_SHOW));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         TweenMax.to(this.kungfuLvCanvas,1,{
            "x":524,
            "onComplete":this.onCom
         });
         if(parent != null)
         {
            parent.removeChild(this);
         }
         this.tianFuCanvas.isAuto = false;
      }
      
      public function showParty(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("门派绝学"));
         }
         this.setCanvasVisible(1);
      }
      
      public function setPartyKungfu(param1:Array) : void
      {
         this.partyKungFu.setSkill(param1);
      }
      
      public function getPartyKungfuBySkill(param1:Skill) : ItemFace
      {
         return this.partyKungFu.getKungFuBySkill(param1);
      }
      
      public function showJiangHu(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("江湖绝学"));
         }
         this.setCanvasVisible(2);
      }
      
      public function setJiangHuKungfu(param1:Array) : void
      {
         this.jiangHuKungFu.setSkill(param1);
      }
      
      public function getJiangHuKungfuBySkill(param1:Skill) : ItemFace
      {
         return this.jiangHuKungFu.getKungFuBySkill(param1);
      }
      
      public function showOther(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("其他绝学"));
         }
         this.setCanvasVisible(3);
      }
      
      public function showWufang(param1:Boolean = false) : void
      {
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("武防"));
         }
         this.setCanvasVisible(4);
      }
      
      public function setOtherKungfu(param1:Array) : void
      {
         this.otherKungFu.setSkill(param1);
      }
      
      public function getOtherKungfuBySkill(param1:Skill) : ItemFace
      {
         return this.otherKungFu.getKungFuBySkill(param1);
      }
      
      public function setSkillBook(param1:Goods) : void
      {
         if(this.partyKungFu.visible && this.partyKungFu.studyCanvas.visible)
         {
            this.partyKungFu.studyCanvas.ITEM = param1;
         }
         if(this.jiangHuKungFu.visible && this.jiangHuKungFu.studyCanvas.visible)
         {
            this.jiangHuKungFu.studyCanvas.ITEM = param1;
         }
         if(this.otherKungFu.visible)
         {
            this.otherKungFu.studyCanvas.ITEM = param1;
         }
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
      
      public function showKungFuBreakthroughPanel(param1:Skill) : void
      {
         if(!this.kungfuBreakthrough)
         {
            this.kungfuBreakthrough = new KungFuBreakthroughPanel();
         }
         this.kungfuBreakthrough.visible = true;
         this.kungfuBreakthrough.$parent = this;
         this.kungfuBreakthrough.setInitialize(param1);
         GameInstance.uiInstance.uiContainer.addChild(this.kungfuBreakthrough);
         this.kungfuBreakthrough.x = (GameConfig.sceneWidth - this.kungfuBreakthrough.width) / 2;
         this.kungfuBreakthrough.y = (GameConfig.sceneHeight - this.kungfuBreakthrough.height) / 2;
      }
      
      public function closeKungFuBreakthroughPanel() : void
      {
         this.kungfuBreakthrough.onClose1();
      }
      
      public function showMask(param1:Boolean) : void
      {
         var _loc2_:Bitmap = null;
         if(param1)
         {
            this.kuafuMask = new Sprite();
            this.kuafuMask.graphics.beginFill(6052956,0.9);
            this.kuafuMask.graphics.drawRect(0,0,200,86);
            this.kuafuMask.graphics.endFill();
            _loc2_ = StaticValue.getBitmapByClassName("ui.mask.lock");
            this.kuafuMask.addChild(_loc2_);
            _loc2_.x = (200 - _loc2_.width) / 2;
            _loc2_.y = (86 - _loc2_.height) / 2;
            addChild(this.kuafuMask);
            this.kuafuMask.x = 261;
            this.kuafuMask.y = 308;
         }
         else if(Boolean(this.kuafuMask) && Boolean(this.kuafuMask.parent))
         {
            this.kuafuMask.parent.removeChild(this.kuafuMask);
            this.kuafuMask = null;
         }
      }
      
      public function setWufang(param1:Number) : void
      {
         this.wufangCanvas.setData(param1);
      }
      
      public function setTianFuData(param1:Object) : void
      {
         this.setCanvasVisible(5);
         this.tianFuCanvas.setData(param1);
      }
      
      public function setTianFuUpSuccess(param1:Boolean) : void
      {
         this.tianFuCanvas.setUpSuccess(param1);
      }
      
      private function setCanvasVisible(param1:int) : void
      {
         if(Boolean(this.curCanvas) && this.curCanvas.visible == true)
         {
            this.curCanvas.visible = false;
         }
         switch(param1)
         {
            case 1:
               this.curCanvas = this.partyKungFu as DisplayObject;
               break;
            case 2:
               this.curCanvas = this.jiangHuKungFu as DisplayObject;
               break;
            case 3:
               this.curCanvas = this.otherKungFu as DisplayObject;
               break;
            case 4:
               this.curCanvas = this.wufangCanvas as DisplayObject;
               break;
            case 5:
               this.curCanvas = this.tianFuCanvas as DisplayObject;
         }
         this.curCanvas.visible = true;
      }
   }
}

