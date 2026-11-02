package com.tgame.shell.view.components.ride.strengthen
{
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.RidePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class EnergyPotentialCanvas extends Sprite
   {
      
      private var ft_potential:FTextArea;
      
      private var ft:FTextArea;
      
      private var btn_OK:SecondButton;
      
      public var $parent:DisplayObject;
      
      private var itemContainer:Sprite;
      
      private var autoBtn:SecondButton;
      
      public function EnergyPotentialCanvas()
      {
         super();
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 10;
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("提升出战潜力：") + "</font>";
         addChild(this.ft);
         this.ft_potential = new FTextArea();
         this.ft_potential.x = 10;
         this.ft_potential.y = 30;
         this.ft_potential.width = 265;
         this.ft_potential.htmlText = LanResManager.getLanCommonTextWords("当前潜力：") + "100 -> " + LanResManager.getLanCommonTextWords("上限潜力:2000");
         addChild(this.ft_potential);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 55;
         this.ft.wordWrap = true;
         this.ft.height = 60;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("(提升出战坐骑的出战潜力可以提高坐骑为您带来的属性加成)");
         this.ft.width = 305;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 100 + 10 + 30;
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\' size=\'14\'>" + LanResManager.getLanCommonTextWords("坐骑神丹") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 100;
         this.ft.y = 175 - 50 + 30;
         this.ft.width = 295;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次操作消耗【坐骑神丹】X1") + "</font>";
         addChild(this.ft);
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.itemContainer.x = 18;
         this.itemContainer.y = 184 - 50 + 30;
         this.btn_OK = new SecondButton();
         this.btn_OK.x = width / 2 / 2 - this.btn_OK.width / 2;
         this.btn_OK.y = 200 - 50 + 30;
         this.btn_OK.label = LanResManager.getLanCommonTextWords("开始提升");
         addChild(this.btn_OK);
         this.btn_OK.addEventListener(MouseEvent.CLICK,this.onClick);
         this.autoBtn = new SecondButton();
         this.autoBtn.label = LanResManager.getLanCommonTextWords("自动提升");
         addChild(this.autoBtn);
         this.autoBtn.x = width / 2 + width / 2 / 2 - this.autoBtn.width / 2 - 40;
         this.autoBtn.y = 200 - 50 + 30;
         this.autoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.target)
         {
            case this.btn_OK:
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.ENERGYPOTENTIAL_CLICK,"",0));
               break;
            case this.autoBtn:
               _loc2_ = 0;
               if(this.autoBtn.label == LanResManager.getLanCommonTextWords("自动提升"))
               {
                  _loc2_ = 1;
               }
               else
               {
                  _loc2_ = 2;
               }
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.RENEWENERGY_START,"",_loc2_));
         }
      }
      
      public function setItem(param1:Goods) : void
      {
         while(this.itemContainer.numChildren)
         {
            this.itemContainer.removeChildAt(0);
         }
         var _loc2_:Bitmap = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc2_.x = 1;
         _loc2_.y = 1;
         this.itemContainer.addChild(_loc2_);
         var _loc3_:ItemFace = new ItemFace(param1);
         if(param1.count <= 0)
         {
            _loc3_.filters = Tools.blackWhiteFilter;
            this.btn_OK.enabled = false;
            this.autoBtn.enabled = false;
            this.autoBtn.label = LanResManager.getLanCommonTextWords("自动提升");
         }
         else
         {
            _loc3_.filters = [];
            this.autoBtn.enabled = true;
            this.btn_OK.enabled = true;
         }
         _loc3_.x = 2;
         _loc3_.y = 2;
         this.itemContainer.addChild(_loc3_);
      }
      
      public function setPotential(param1:int, param2:int) : void
      {
         param1 *= 100;
         param2 *= 100;
         this.ft_potential.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前潜力：") + param1 + " -> " + LanResManager.getLanCommonTextWords("上限潜力:") + param2 + "</font>";
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.autoBtn.label = LanResManager.getLanCommonTextWords("自动提升");
         }
         else
         {
            this.autoBtn.label = LanResManager.getLanCommonTextWords("停止提升");
         }
      }
      
      public function reBtnState() : Boolean
      {
         var _loc1_:Boolean = false;
         if(this.autoBtn.label == LanResManager.getLanCommonTextWords("停止提升"))
         {
            _loc1_ = true;
         }
         return _loc1_;
      }
   }
}

