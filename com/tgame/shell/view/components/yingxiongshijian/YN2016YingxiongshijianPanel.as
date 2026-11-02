package com.tgame.shell.view.components.yingxiongshijian
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.SimpleButton;
   import game.skin.YingXiongShiJianSkin;
   import game.utils.SkinTools;
   
   public class YN2016YingxiongshijianPanel extends BasePanel
   {
      
      private var guanbi:SimpleButton;
      
      private var lingqu1:SimpleButton;
      
      private var lingqu2:SimpleButton;
      
      private var lingqu3:SimpleButton;
      
      private var lingqu4:SimpleButton;
      
      private var lingqu5:SimpleButton;
      
      public function YN2016YingxiongshijianPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YingXiongShiJianSkin.skin,"yingxiongshijian");
      }
      
      override protected function createVariableReference() : void
      {
         var _loc3_:Player = null;
         var _loc4_:int = 0;
         var _loc5_:ItemFace = null;
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,this.gotoClose);
         this.lingqu1 = getChildByName("lingquanniu1") as SimpleButton;
         this.lingqu1.addEventListener(MouseEvent.CLICK,this.onclick);
         this.lingqu1.name = "1";
         this.lingqu2 = getChildByName("lingquanniu2") as SimpleButton;
         this.lingqu2.addEventListener(MouseEvent.CLICK,this.onclick);
         this.lingqu2.name = "2";
         this.lingqu3 = getChildByName("lingquanniu3") as SimpleButton;
         this.lingqu3.addEventListener(MouseEvent.CLICK,this.onclick);
         this.lingqu3.name = "3";
         this.lingqu4 = getChildByName("lingquanniu4") as SimpleButton;
         this.lingqu4.addEventListener(MouseEvent.CLICK,this.onclick);
         this.lingqu4.name = "4";
         this.lingqu5 = getChildByName("lingquanniu5") as SimpleButton;
         this.lingqu5.addEventListener(MouseEvent.CLICK,this.onclick);
         this.lingqu5.name = "5";
         var _loc1_:Array = [712678,null,725809,725823,723896];
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            if(_loc2_ == 1)
            {
               _loc3_ = GameInstance.mainChar.data as Player;
               _loc4_ = _loc3_.attributeInfo.getSex();
               if(_loc4_ == 1)
               {
                  _loc4_ = 7500036;
               }
               else
               {
                  _loc4_ = 7500037;
               }
               _loc5_ = new ItemFace(new Goods(_loc4_));
               addChild(_loc5_);
               _loc5_.x = 243;
               _loc5_.y = 177 + _loc2_ * 53;
            }
            else
            {
               _loc5_ = new ItemFace(new Goods(_loc1_[_loc2_]));
               addChild(_loc5_);
               _loc5_.x = 243;
               _loc5_.y = 177 + _loc2_ * 53;
            }
            _loc2_++;
         }
      }
      
      protected function onclick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[84,int(param1.target.name)]);
      }
      
      private function gotoClose(param1:MouseEvent) : void
      {
         this.onClose();
      }
      
      override public function onClose(param1:* = null) : void
      {
         super.onClose();
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

