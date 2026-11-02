package com.tgame.shell.view.components.shengrizhouji
{
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import game.display.SimpleButton;
   import game.skin.SengRiZhouJiSkin;
   import game.utils.SkinTools;
   
   public class YN2016ShengrizhoujiPanel extends BasePanel
   {
      
      private var lingqu1:SimpleButton;
      
      private var lingqu2:SimpleButton;
      
      private var lingqu3:SimpleButton;
      
      private var lingqu4:SimpleButton;
      
      private var lingqu5:SimpleButton;
      
      private var lingqu6:SimpleButton;
      
      private var lingqu7:SimpleButton;
      
      private var lingqu8:SimpleButton;
      
      private var lingqu9:SimpleButton;
      
      private var lingqu10:SimpleButton;
      
      private var lingqu11:SimpleButton;
      
      private var lingqu12:SimpleButton;
      
      private var lingqu13:SimpleButton;
      
      private var lingqu14:SimpleButton;
      
      private var guanbi:SimpleButton;
      
      private var sp:Sprite;
      
      private var goArr:Array = [[712810,1],[724678,1],[726086,1],[726272,1],[712810,1],[726086,1],[724678,1],[42583,200],[42352,10],[42353,10],[41305,50],[41785,50],[711494,60],[711495,60]];
      
      public function YN2016ShengrizhoujiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(SengRiZhouJiSkin.skin,"shengrizhouji");
      }
      
      override protected function createVariableReference() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Goods = null;
         var _loc3_:ItemFace = null;
         this.guanbi = getChildByName("teshuguanbianniu") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,onClose);
         this.sp = new Sprite();
         addChild(this.sp);
         _loc1_ = 1;
         while(_loc1_ <= 14)
         {
            this["lingqu" + _loc1_] = getChildByName("teshuanniu" + _loc1_) as SimpleButton;
            this["lingqu" + _loc1_].addEventListener(MouseEvent.CLICK,this.onClick);
            this["lingqu" + _loc1_].name = _loc1_;
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.goArr.length)
         {
            _loc2_ = new Goods(int(this.goArr[_loc1_][0]));
            _loc2_.count = this.goArr[_loc1_][1];
            _loc3_ = new ItemFace(_loc2_,65,65);
            _loc3_.x = 113 + 90 * int(_loc1_ % 7);
            if(_loc1_ < 7)
            {
               _loc3_.y = 264;
            }
            else
            {
               _loc3_.y = 510;
            }
            this.sp.addChild(_loc3_);
            _loc1_++;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[90,param1.target.name]);
      }
   }
}

