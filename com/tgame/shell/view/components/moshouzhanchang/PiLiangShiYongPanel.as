package com.tgame.shell.view.components.moshouzhanchang
{
   import com.asQuery.$;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldType;
   import game.display.Label;
   import game.skin.ShuRuXiaoJieMianSkin;
   import game.utils.SkinTools;
   
   public class PiLiangShiYongPanel extends BasePanel
   {
      
      public static const PILIANGSHIYONG_CLICK:String = "PILIANGSHIYONG_CLICK";
      
      private var txt:Label;
      
      private var goods:Goods;
      
      private var type:int;
      
      private var maxNum:int;
      
      public function PiLiangShiYongPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ShuRuXiaoJieMianSkin.skin,"shiyongxiaojiemian");
         $("shiyonganniu",this,true).click(this.onClickHandler);
         $("zuiduoanniu",this,true).click(this.onClickHandler);
         $("guanbi",this,true).click(this.onClickHandler);
      }
      
      override protected function createVariableReference() : void
      {
         this.txt = getChildByName("txt") as Label;
         this.txt.type = TextFieldType.INPUT;
         this.txt.text = "0";
         this.txt.restrict = "0-9";
         this.txt.maxChars = 4;
         this.txt.addEventListener(Event.CHANGE,this.onChangeHandler);
      }
      
      private function onChangeHandler(param1:Event) : void
      {
         var _loc2_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.goods.id);
         var _loc3_:int = 0;
         _loc3_ = this.maxNum > _loc2_ ? _loc2_ : this.maxNum;
         this.txt.text = int(this.txt.text) >= _loc3_ ? _loc3_ + "" : this.txt.text;
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.target.name)
         {
            case "shiyonganniu":
               dispatchEvent(new BaseEvent(PiLiangShiYongPanel.PILIANGSHIYONG_CLICK,"",{
                  "type":this.type,
                  "id":this.goods.id,
                  "position":this.goods.position,
                  "count":int(this.txt.text)
               }));
               if(Boolean(this) && Boolean(this.parent))
               {
                  this.parent.removeChild(this);
               }
               break;
            case "zuiduoanniu":
               _loc2_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.goods.id);
               $("txt",this,true).attr("text",_loc2_ >= this.maxNum ? this.maxNum : _loc2_);
               break;
            case "guanbi":
               if(Boolean(this) && Boolean(this.parent))
               {
                  this.parent.removeChild(this);
               }
         }
      }
      
      public function setData(param1:Goods) : void
      {
         this.goods = param1;
         if(this.goods.res.kind == 11)
         {
            this.type = 2;
            this.maxNum = 9999;
         }
         else
         {
            this.type = 1;
            this.maxNum = 9999;
         }
      }
   }
}

