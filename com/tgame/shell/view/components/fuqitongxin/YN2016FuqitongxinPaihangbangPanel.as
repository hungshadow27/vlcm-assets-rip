package com.tgame.shell.view.components.fuqitongxin
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.BasePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import game.display.Button;
   import game.display.Label;
   import game.display.List;
   import game.display.SimpleButton;
   import game.skin.jinqianshu20170615Skin;
   import game.utils.SkinTools;
   
   public class YN2016FuqitongxinPaihangbangPanel extends BasePanel
   {
      
      public static const LINGQUJIANGLI:String = "FUQITONGXINPAIHANGBANGLINGQUJIANGLI";
      
      public static const DUIHUANWUPIN:String = "FUQITONGXINPAIHANGBANGDUIHUANWUPIN";
      
      public static const PAIHANGBANG:String = "FUQITONGXINPAIHANGBANGXIANSHI";
      
      public var _parent:DisplayObject;
      
      private var guanbi:SimpleButton;
      
      private var _lingqu:Button;
      
      private var list:List;
      
      private var wenzi:Label;
      
      public function YN2016FuqitongxinPaihangbangPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(jinqianshu20170615Skin.skin,"wushenzhanlianpaihangbang");
      }
      
      override protected function createVariableReference() : void
      {
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,this.gotoClose);
         this._lingqu = getChildByName("lingqu") as Button;
         this._lingqu.addEventListener(MouseEvent.CLICK,this.onclick);
         this.list = getChildByName("paihangbangleibiao") as List;
         this.list.ItemClass = ListElement;
         this.list.verticalGap = 10;
         this.wenzi = getChildByName("panhangbangshuoming") as Label;
         this.wenzi.text = LanResManager.getLanCommonTextWords("排行2016年09月7号23点59结束。") + "\n" + LanResManager.getLanCommonTextWords("玩家2016年09月7号23点59前领取奖励。") + "\n" + LanResManager.getLanCommonTextWords("服务器贡献浇水次数最多的前5名将获得奖励。");
      }
      
      protected function onclick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(LINGQUJIANGLI));
      }
      
      public function setdata(param1:Object) : void
      {
         this.list.DataSource = param1.arr;
         this._lingqu.enabled = this._lingqu.mouseEnabled = param1.end;
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

import game.display.Label;
import game.display.ListItemRender;

class ListElement extends ListItemRender
{
   
   private var _name:Label;
   
   private var _paihang:Label;
   
   private var _jifen:Label;
   
   public function ListElement()
   {
      super();
      this.buttonMode = true;
   }
   
   override protected function createVariableReference() : void
   {
      super.createVariableReference();
      this._jifen = this.getChildByName("wenben6") as Label;
      this._name = this.getChildByName("wenben5") as Label;
      this._paihang = this.getChildByName("wenben4") as Label;
   }
   
   override public function set data(param1:Object) : void
   {
      super.data = param1;
      this._paihang.text = String(param1.paiming);
      this._name.text = param1.name;
      this._jifen.text = String(param1.jifen);
   }
}
