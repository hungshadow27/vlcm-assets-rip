package com.tgame.shell.view.components.fangyanhua
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.SimpleButton;
   import game.skin.FangYanHua20191106Skin;
   import game.utils.SkinTools;
   
   public class YN2017FangyanhuaPanel extends BasePanel
   {
      
      private var btn1:SimpleButton;
      
      private var btn2:SimpleButton;
      
      private var btn3:SimpleButton;
      
      private var item:ItemFace;
      
      private var guanbi:SimpleButton;
      
      private var _container:Container;
      
      private var arr1:Array = [];
      
      private var arr2:Array = [];
      
      public function YN2017FangyanhuaPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(FangYanHua20191106Skin.skin,"fangyanhua");
      }
      
      override protected function createVariableReference() : void
      {
         var _loc1_:Goods = null;
         this._container = new Container();
         addChild(this._container);
         this._container.x = -148;
         this._container.y = 81;
         this.btn1 = getChildByName("Nopanniu") as SimpleButton;
         this.btn1.name = "1";
         this.btn2 = getChildByName("Nhananniu") as SimpleButton;
         this.btn2.name = "2";
         this.btn3 = getChildByName("lingqu") as SimpleButton;
         this.btn3.name = "3";
         this.guanbi = getChildByName("YBZLGBAN") as SimpleButton;
         this.btn1.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn2.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn3.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.guanbi.addEventListener(MouseEvent.CLICK,onClose);
      }
      
      public function setFangYanHuaData(param1:int) : void
      {
         $("wenben1",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[101,uint(param1.target.name)]);
      }
   }
}

