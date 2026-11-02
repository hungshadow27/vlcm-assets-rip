package com.tgame.shell.view.components.chunjie123
{
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.Image;
   import game.display.RadioButton;
   import game.display.RadioButtonGroup;
   import game.display.SimpleButton;
   import game.skin.ChunYiErSanMianBanSkin;
   import game.utils.SkinTools;
   
   public class YN2017ChunjiehuodongPanel extends BasePanel
   {
      
      private var btnGroup:RadioButtonGroup;
      
      private var btn1:RadioButton;
      
      private var btn2:RadioButton;
      
      private var btn3:RadioButton;
      
      private var guanbi:SimpleButton;
      
      private var lingqu1:SimpleButton;
      
      private var lingqu2:SimpleButton;
      
      private var lingqu3:SimpleButton;
      
      private var lingqu4:SimpleButton;
      
      private var daysImg1:Image;
      
      private var daysImg2:Image;
      
      private var daysImg3:Image;
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var arr2:Array = [];
      
      private var arr3:Array = [];
      
      private var days:int = 1;
      
      private var type:int = 0;
      
      public function YN2017ChunjiehuodongPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ChunYiErSanMianBanSkin.skin,"ChunJieMianBan");
      }
      
      override protected function createVariableReference() : void
      {
         this._container = new Container();
         addChild(this._container);
         this._container.x = -126;
         this._container.y = 141;
         this.arr1 = [null,[713233,1],[725550,10000],[42759,50],[728450,1]];
         this.arr2 = [null,[713233,1],[725550,10000],[44939,50],[728455,1]];
         this.arr3 = [null,[713233,1],[725550,10000],[728280,100],[728460,1]];
         this.btnGroup = getChildByName("YEQIAN") as RadioButtonGroup;
         this.btn1 = this.btnGroup.getChildByName("yeqian1") as RadioButton;
         this.btn2 = this.btnGroup.getChildByName("yeqian2") as RadioButton;
         this.btn3 = this.btnGroup.getChildByName("yeqian3") as RadioButton;
         this.btnGroup.selection = this.btn1;
         this.guanbi = getChildByName("YBZLGBAN") as SimpleButton;
         this.lingqu1 = getChildByName("DFZQLQAN1") as SimpleButton;
         this.lingqu2 = getChildByName("DFZQLQAN2") as SimpleButton;
         this.lingqu3 = getChildByName("DFZQLQAN3") as SimpleButton;
         this.lingqu4 = getChildByName("DFZQLQAN4") as SimpleButton;
         this.lingqu1.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.lingqu2.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.lingqu3.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.lingqu4.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.lingqu1.name = "1";
         this.lingqu2.name = "2";
         this.lingqu3.name = "3";
         this.lingqu4.name = "4";
         this.btn1.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn2.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn3.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.guanbi.addEventListener(MouseEvent.CLICK,onClose);
         this.daysImg1 = getChildByName("jitu") as Image;
         this.daysImg2 = getChildByName("xigua") as Image;
         this.daysImg3 = getChildByName("lingshi") as Image;
         this.daysImg1.visible = false;
         this.daysImg2.visible = false;
         this.daysImg3.visible = false;
         this.setDataGoods(this.arr1,this.days);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn1:
               this.days = 1;
               this.setDataGoods(this.arr1,this.days);
               break;
            case this.btn2:
               this.days = 2;
               this.setDataGoods(this.arr2,this.days);
               break;
            case this.btn3:
               this.days = 3;
               this.setDataGoods(this.arr3,this.days);
               break;
            case this.lingqu1:
            case this.lingqu2:
            case this.lingqu3:
            case this.lingqu4:
               PipeManager.sendMsg(PipeConstants.SEND_53095,[105,this.days,uint(param1.target.name)]);
         }
      }
      
      private function setDataGoods(param1:Array, param2:int) : void
      {
         var _loc3_:Goods = null;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc4_:int = 1;
         while(_loc4_ < 5)
         {
            _loc3_ = new Goods(param1[_loc4_][0]);
            _loc3_.count = param1[_loc4_][1];
            this.item = new ItemFace(_loc3_,65,65);
            this.item.y = 110 + 76 * (_loc4_ - 1);
            this.item.x = 640;
            this._container.addChild(this.item);
            _loc4_++;
         }
         switch(param2)
         {
            case 1:
               this.daysImg1.visible = true;
               this.daysImg2.visible = false;
               this.daysImg3.visible = false;
               break;
            case 2:
               this.daysImg1.visible = false;
               this.daysImg2.visible = true;
               this.daysImg3.visible = false;
               break;
            case 3:
               this.daysImg1.visible = false;
               this.daysImg2.visible = false;
               this.daysImg3.visible = true;
         }
      }
   }
}

