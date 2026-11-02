package com.tgame.shell.view.components.ynSpecial
{
   import com.tgame.common.ui.componets.BasePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.MouseEvent;
   import game.display.Button;
   import game.display.SimpleButton;
   import game.skin.jinqianshu20170615Skin;
   import game.utils.SkinTools;
   
   public class YNjinqianshuPanel extends BasePanel
   {
      
      public static const JINQIANSHULINGQV:String = "JINQIANSHULINGQV";
      
      public static const JINQIANSHUTIJIAO:String = "JINQIANSHUTIJIAO";
      
      private var guanbi:SimpleButton;
      
      private var paihang:Button;
      
      private var lingqu1:Button;
      
      private var lingqu2:Button;
      
      private var lingqu3:Button;
      
      private var lingqu4:Button;
      
      private var lingqu5:Button;
      
      private var tijiaojinqianye:Button;
      
      private var tijiaotongqian:Button;
      
      private var jinqianshupaihang:YNjinqianshuPaihangPanel;
      
      private var arr2:Array = [];
      
      private var boo:Boolean;
      
      public function YNjinqianshuPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(jinqianshu20170615Skin.skin,"jinqianshu");
      }
      
      override protected function createVariableReference() : void
      {
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,this.gotoClose);
         this.paihang = getChildByName("paihangbang") as Button;
         this.paihang.addEventListener(MouseEvent.CLICK,this.clickfunction);
         this.lingqu1 = getChildByName("lingqu1") as Button;
         this.lingqu1.addEventListener(MouseEvent.CLICK,this.clickfunction);
         this.lingqu2 = getChildByName("lingqu2") as Button;
         this.lingqu2.addEventListener(MouseEvent.CLICK,this.clickfunction);
         this.lingqu3 = getChildByName("lingqu3") as Button;
         this.lingqu3.addEventListener(MouseEvent.CLICK,this.clickfunction);
         this.lingqu4 = getChildByName("lingqu4") as Button;
         this.lingqu4.addEventListener(MouseEvent.CLICK,this.clickfunction);
         this.lingqu5 = getChildByName("lingqu5") as Button;
         this.lingqu5.addEventListener(MouseEvent.CLICK,this.clickfunction);
         this.tijiaojinqianye = getChildByName("tijiaojinqianye") as Button;
         this.tijiaojinqianye.addEventListener(MouseEvent.CLICK,this.clickfunction);
         this.tijiaotongqian = getChildByName("tijiaotongqian") as Button;
         this.tijiaotongqian.addEventListener(MouseEvent.CLICK,this.clickfunction);
         if(!this.jinqianshupaihang || !this.jinqianshupaihang.parent)
         {
            this.jinqianshupaihang = new YNjinqianshuPaihangPanel();
         }
      }
      
      protected function clickfunction(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.paihang:
               this.paimingfunction();
               break;
            case this.lingqu1:
               dispatchEvent(new BaseEvent(JINQIANSHULINGQV,"",1));
               break;
            case this.lingqu2:
               dispatchEvent(new BaseEvent(JINQIANSHULINGQV,"",2));
               break;
            case this.lingqu3:
               dispatchEvent(new BaseEvent(JINQIANSHULINGQV,"",3));
               break;
            case this.lingqu4:
               dispatchEvent(new BaseEvent(JINQIANSHULINGQV,"",4));
               break;
            case this.lingqu5:
               dispatchEvent(new BaseEvent(JINQIANSHULINGQV,"",5));
               break;
            case this.tijiaojinqianye:
               dispatchEvent(new BaseEvent(JINQIANSHUTIJIAO,"",2));
               break;
            case this.tijiaotongqian:
               dispatchEvent(new BaseEvent(JINQIANSHUTIJIAO,"",3));
         }
      }
      
      private function paimingfunction() : void
      {
         if(!Fun.isVisible(this.jinqianshupaihang))
         {
            this.addChild(this.jinqianshupaihang);
         }
         this.jinqianshupaihang._parent = this;
         this.jinqianshupaihang.x = 676;
         this.jinqianshupaihang.y = 0;
      }
      
      public function setdata(param1:Object) : void
      {
         this.arr2 = param1.arr;
         var _loc2_:int = 0;
         while(_loc2_ < param1.arr2.length)
         {
            if(_loc2_ < 5)
            {
               this["lingqu" + String(_loc2_ + 1)].enabled = param1.arr2[_loc2_].btntype;
               this["lingqu" + String(_loc2_ + 1)].mouseEnabled = param1.arr2[_loc2_].btntype;
            }
            _loc2_++;
         }
         this.boo = param1.arr2[5].btntype;
         this.jinqianshupaihang.setdata(this.arr2);
         this.jinqianshupaihang.setbtn(this.boo);
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

