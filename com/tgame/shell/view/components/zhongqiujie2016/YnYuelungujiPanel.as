package com.tgame.shell.view.components.zhongqiujie2016
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.vo.character.info.GoodsInfo;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Image;
   import game.display.SimpleButton;
   import game.skin.yuelungujiSkin;
   import game.utils.SkinTools;
   
   public class YnYuelungujiPanel extends BasePanel
   {
      
      private var guanbi:SimpleButton;
      
      private var lingqu1:SimpleButton;
      
      private var lingqu2:SimpleButton;
      
      private var lingqu3:SimpleButton;
      
      private var lingqu4:SimpleButton;
      
      private var lingqu5:SimpleButton;
      
      private var yuebing1:Image;
      
      private var yuebing2:Image;
      
      private var yuebing3:Image;
      
      private var xingdeng1:Image;
      
      private var xingdeng2:Image;
      
      private var xingdeng3:Image;
      
      private var change1:Image;
      
      private var change2:Image;
      
      private var change3:Image;
      
      private var yutu1:Image;
      
      private var yutu2:Image;
      
      private var yutu3:Image;
      
      private var liyudeng1:Image;
      
      private var liyudeng2:Image;
      
      private var liyudeng3:Image;
      
      public function YnYuelungujiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(yuelungujiSkin.skin,"yuelunguji");
      }
      
      override protected function createVariableReference() : void
      {
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
         this.yuebing1 = getChildByName("zhongqiugao1") as Image;
         this.yuebing1.visible = false;
         this.yuebing2 = getChildByName("zhongqiugao2") as Image;
         this.yuebing2.visible = false;
         this.yuebing3 = getChildByName("zhongqiugao3") as Image;
         this.yuebing3.visible = false;
         this.xingdeng1 = getChildByName("xingdeng1") as Image;
         this.xingdeng1.visible = false;
         this.xingdeng2 = getChildByName("xingdeng2") as Image;
         this.xingdeng2.visible = false;
         this.xingdeng3 = getChildByName("xingdeng3") as Image;
         this.xingdeng3.visible = false;
         this.change1 = getChildByName("change1") as Image;
         this.change1.visible = false;
         this.change2 = getChildByName("change2") as Image;
         this.change2.visible = false;
         this.change3 = getChildByName("change3") as Image;
         this.change3.visible = false;
         this.liyudeng1 = getChildByName("liyudeng1") as Image;
         this.liyudeng1.visible = false;
         this.liyudeng2 = getChildByName("liyudeng2") as Image;
         this.liyudeng2.visible = false;
         this.liyudeng3 = getChildByName("liyudeng3") as Image;
         this.liyudeng3.visible = false;
         this.yutu1 = getChildByName("yutu1") as Image;
         this.yutu1.visible = false;
         this.yutu2 = getChildByName("yutu2") as Image;
         this.yutu2.visible = false;
         this.yutu3 = getChildByName("yutu3") as Image;
         this.yutu3.visible = false;
      }
      
      public function ImaVisible() : void
      {
         var _loc4_:int = 0;
         var _loc1_:Array = [[725967,725968,725969],[725970,725971,725972],[725973,725974,725975],[725976,725977,725978],[725979,725980,725981]];
         var _loc2_:GoodsInfo = GameInstance.mainCharData.goodsInfo;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.length)
         {
            switch(_loc3_)
            {
               case 0:
                  _loc4_ = _loc2_.getGoodsNumByID(_loc1_[_loc3_][0],true);
                  if(_loc4_ > 0)
                  {
                     this.yuebing1.visible = true;
                  }
                  else
                  {
                     this.yuebing1.visible = false;
                  }
                  _loc4_ = _loc2_.getGoodsNumByID(_loc1_[_loc3_][1],true);
                  if(_loc4_ > 0)
                  {
                     this.yuebing2.visible = true;
                  }
                  else
                  {
                     this.yuebing2.visible = false;
                  }
                  _loc4_ = _loc2_.getGoodsNumByID(_loc1_[_loc3_][2],true);
                  if(_loc4_ > 0)
                  {
                     this.yuebing3.visible = true;
                  }
                  else
                  {
                     this.yuebing3.visible = false;
                  }
                  break;
               case 1:
                  _loc4_ = _loc2_.getGoodsNumByID(_loc1_[_loc3_][0],true);
                  if(_loc4_ > 0)
                  {
                     this.xingdeng1.visible = true;
                  }
                  else
                  {
                     this.xingdeng1.visible = false;
                  }
                  _loc4_ = _loc2_.getGoodsNumByID(_loc1_[_loc3_][1],true);
                  if(_loc4_ > 0)
                  {
                     this.xingdeng2.visible = true;
                  }
                  else
                  {
                     this.xingdeng2.visible = false;
                  }
                  _loc4_ = _loc2_.getGoodsNumByID(_loc1_[_loc3_][2],true);
                  if(_loc4_ > 0)
                  {
                     this.xingdeng3.visible = true;
                  }
                  else
                  {
                     this.xingdeng3.visible = false;
                  }
                  break;
               case 2:
                  _loc4_ = _loc2_.getGoodsNumByID(_loc1_[_loc3_][0],true);
                  if(_loc4_ > 0)
                  {
                     this.change1.visible = true;
                  }
                  else
                  {
                     this.change1.visible = false;
                  }
                  _loc4_ = _loc2_.getGoodsNumByID(_loc1_[_loc3_][1],true);
                  if(_loc4_ > 0)
                  {
                     this.change2.visible = true;
                  }
                  else
                  {
                     this.change2.visible = false;
                  }
                  _loc4_ = _loc2_.getGoodsNumByID(_loc1_[_loc3_][2],true);
                  if(_loc4_ > 0)
                  {
                     this.change3.visible = true;
                  }
                  else
                  {
                     this.change3.visible = false;
                  }
                  break;
               case 3:
                  _loc4_ = _loc2_.getGoodsNumByID(_loc1_[_loc3_][0],true);
                  if(_loc4_ > 0)
                  {
                     this.liyudeng1.visible = true;
                  }
                  else
                  {
                     this.liyudeng1.visible = false;
                  }
                  _loc4_ = _loc2_.getGoodsNumByID(_loc1_[_loc3_][1],true);
                  if(_loc4_ > 0)
                  {
                     this.liyudeng2.visible = true;
                  }
                  else
                  {
                     this.liyudeng2.visible = false;
                  }
                  _loc4_ = _loc2_.getGoodsNumByID(_loc1_[_loc3_][2],true);
                  if(_loc4_ > 0)
                  {
                     this.liyudeng3.visible = true;
                  }
                  else
                  {
                     this.liyudeng3.visible = false;
                  }
                  break;
               case 4:
                  _loc4_ = _loc2_.getGoodsNumByID(_loc1_[_loc3_][0],true);
                  if(_loc4_ > 0)
                  {
                     this.yutu1.visible = true;
                  }
                  else
                  {
                     this.yutu1.visible = false;
                  }
                  _loc4_ = _loc2_.getGoodsNumByID(_loc1_[_loc3_][1],true);
                  if(_loc4_ > 0)
                  {
                     this.yutu2.visible = true;
                  }
                  else
                  {
                     this.yutu2.visible = false;
                  }
                  _loc4_ = _loc2_.getGoodsNumByID(_loc1_[_loc3_][2],true);
                  if(_loc4_ > 0)
                  {
                     this.yutu3.visible = true;
                  }
                  else
                  {
                     this.yutu3.visible = false;
                  }
            }
            _loc3_++;
         }
      }
      
      protected function onclick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[87,int(param1.target.name)]);
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

