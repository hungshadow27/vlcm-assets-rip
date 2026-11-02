package com.tgame.shell.view.components.yingxiongmingcheng
{
   import com.asQuery.$;
   import com.fireice.util.Tools;
   import com.tgame.common.ui.componets.BasePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.display.SimpleButton;
   import game.skin.yingxiongmingchengSkin;
   import game.utils.SkinTools;
   
   public class YN2017YingXiongMingChengPanel extends BasePanel
   {
      
      public static const LINGQUJIANGLI:String = "YINGXIONGMINGCHENGLINGQUJIANGLI";
      
      public static const DUIHUANWUPIN:String = "YINGXIONGMINGCHENGDUIHUANWUPIN";
      
      public static const PAIHANGBANG:String = "PAIHANGBANG";
      
      private var guanbi:SimpleButton;
      
      private var _lingqu:SimpleButton;
      
      private var _tijiao:SimpleButton;
      
      public function YN2017YingXiongMingChengPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(yingxiongmingchengSkin.skin,"yingxiongmingcheng");
      }
      
      override protected function createVariableReference() : void
      {
         this.guanbi = getChildByName("YBZLGBAN") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,this.gotoClose);
         this._lingqu = getChildByName("Nhan") as SimpleButton;
         this._lingqu.addEventListener(MouseEvent.CLICK,this.onclick);
         this._tijiao = getChildByName("Nop") as SimpleButton;
         this._tijiao.addEventListener(MouseEvent.CLICK,this.onclick);
         $("wenben1",this,true).attr("text","");
         $("wenben2",this,true).attr("text","");
         $("wenben3",this,true).attr("text","");
         $("wenben4",this,true).attr("text","");
         $("wenben5",this,true).attr("text","");
         $("wenben6",this,true).attr("text","");
         $("wenben7",this,true).attr("text","");
         $("wenben8",this,true).attr("text","");
         $("wenben9",this,true).attr("text","");
         $("wenben10",this,true).attr("text","");
      }
      
      protected function onclick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this._lingqu:
               dispatchEvent(new BaseEvent(LINGQUJIANGLI));
               break;
            case this._tijiao:
               dispatchEvent(new BaseEvent(DUIHUANWUPIN));
         }
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
      
      public function setData(param1:Object) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.arr.length)
         {
            $("wenben" + int(_loc2_ + 1),this,true).attr("text",param1.arr[_loc2_].name);
            $("wenben" + int(_loc2_ + 6),this,true).attr("text",param1.arr[_loc2_].jifen);
            _loc2_++;
         }
         if(param1.isLingqu == 0)
         {
            this._lingqu.mouseChildren = this._lingqu.mouseEnabled = false;
            this._lingqu.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this._lingqu.mouseChildren = this._lingqu.mouseEnabled = true;
            this._lingqu.filters = [];
         }
      }
   }
}

