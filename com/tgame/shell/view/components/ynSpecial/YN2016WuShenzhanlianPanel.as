package com.tgame.shell.view.components.ynSpecial
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.SecondButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import game.display.SimpleButton;
   import game.skin.wushenzhanlianpaihangbangSkin;
   import game.utils.SkinTools;
   
   public class YN2016WuShenzhanlianPanel extends BasePanel
   {
      
      public static const WUSHEN_LINGQU:String = "WUSHEN_LINGQU";
      
      public static const WUSHEN_TIJIAO:String = "WUSHEN_TIJIAO";
      
      public static const WUSHEN_FANYE:String = "WUSHEN_FANYE";
      
      public var wushenpaihangPanel:YN2016WushenpaihangPanel;
      
      private var guanbi:SimpleButton;
      
      private var paihang:SecondButton = new SecondButton();
      
      private var box:Sprite = new Sprite();
      
      private var arr:Array = [];
      
      private var o:Object = {};
      
      public function YN2016WuShenzhanlianPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(wushenzhanlianpaihangbangSkin.skin,"wushenzhanliang");
         addChild(this.box);
      }
      
      override public function onClose(param1:* = null) : void
      {
         super.onClose();
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      override protected function createVariableReference() : void
      {
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,this.gotoClose);
         this.paihang.label = LanResManager.getLanCommonTextWords("排行榜");
         this.paihang.x = 240;
         this.paihang.y = 120;
         this.paihang.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function setData(param1:Object) : void
      {
         while(this.box.numChildren > 0)
         {
            this.box.removeChildAt(0);
         }
         this.box.addChild(this.paihang);
         this.arr = param1.arr;
         this.o = param1;
         this.box.x = 251;
         this.box.y = 308;
         if(this.wushenpaihangPanel)
         {
            this.wushenpaihangPanel.setdata(this.arr,this.o);
         }
      }
      
      public function onClick(param1:MouseEvent) : void
      {
         if(!this.wushenpaihangPanel || !this.wushenpaihangPanel.parent)
         {
            this.wushenpaihangPanel = new YN2016WushenpaihangPanel();
            this.addChild(this.wushenpaihangPanel);
         }
         this.wushenpaihangPanel._parent = this;
         this.wushenpaihangPanel.x = 595;
         this.wushenpaihangPanel.setdata(this.arr,this.o);
      }
      
      public function gotoClose(param1:MouseEvent) : void
      {
         this.onClose();
      }
   }
}

