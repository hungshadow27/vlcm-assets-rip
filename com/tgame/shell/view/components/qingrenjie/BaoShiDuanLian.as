package com.tgame.shell.view.components.qingrenjie
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import game.skin.BaoShiDuanLianSkin;
   import game.utils.SkinTools;
   
   public class BaoShiDuanLian extends BasePanel
   {
      
      public static const UI_SHENLONGDAKONG_OK_CLICK:String = "UI_SHENLONGDAKONG_OK_CLICK";
      
      public static const UI_DAKONGSHI_OPTION_PANEL_DRAG_START:String = "UI_DAKONGSHI_OPTION_PANEL_DRAG_START";
      
      public static const UI_DAKONGSHI_OPTION_PANEL_STONE_CLICK:String = "UI_DAKONGSHI_OPTION_PANEL_STONE_CLICK";
      
      public static const UI_DAKONGSHI_OPTION_PANEL_DRAG_ENTER:String = "UI_DAKONGSHI_OPTION_PANEL_DRAG_ENTER";
      
      private var ifItem1:ItemFace;
      
      private var item:ItemFace;
      
      private var stoneContainer:Sprite;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      public function BaoShiDuanLian()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(BaoShiDuanLianSkin.skin,"baoshiduanlian");
         this.setUI();
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_DAKONGSHI_OPTION_PANEL_DRAG_ENTER));
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.stoneContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.stoneContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            dispatchEvent(new BaseEvent(UI_DAKONGSHI_OPTION_PANEL_DRAG_START,"",this.currItem));
            this.stoneContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function setUI() : void
      {
         $("BSDLAN2",this,true).click(onClose);
         $("guanbi",this,true).click(onClose);
         $("BSDLAN1",this,true).click(this.onClick);
         this.stoneContainer = new Sprite();
         addChild(this.stoneContainer);
         this.stoneContainer.x = 0;
         this.stoneContainer.y = 0;
         this.stoneContainer.graphics.beginFill(0,0);
         this.stoneContainer.graphics.drawRect(54,71,70,70);
         this.stoneContainer.graphics.endFill();
         this.stoneContainer.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.stoneContainer.addEventListener(MouseEvent.CLICK,this.onClicks);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_SHENLONGDAKONG_OK_CLICK));
      }
      
      private function onClicks(param1:MouseEvent) : void
      {
         if(param1.target is ItemFace)
         {
            dispatchEvent(new BaseEvent(UI_DAKONGSHI_OPTION_PANEL_STONE_CLICK));
            return;
         }
      }
      
      public function setGoods2(param1:Goods = null) : void
      {
         if(this.ifItem1 != null && this.ifItem1.parent != null)
         {
            this.ifItem1.parent.removeChild(this.ifItem1);
         }
         if(param1 == null)
         {
            return;
         }
         this.ifItem1 = new ItemFace(param1,65,65);
         this.ifItem1.x = 163;
         this.ifItem1.y = 74;
         addChild(this.ifItem1);
      }
      
      public function setGoods1(param1:Goods = null) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         if(param1 == null)
         {
            return;
         }
         this.item = new ItemFace(param1,65,65);
         this.stoneContainer.addChild(this.item);
         this.item.x = 54;
         this.item.y = 73;
      }
      
      public function setNull() : void
      {
         this.setGoods1();
      }
   }
}

