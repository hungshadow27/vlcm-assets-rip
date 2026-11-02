package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.ItemTip;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class FuWenDataPanel extends Sprite
   {
      
      public var _$parent:DisplayObject;
      
      public var _parent2:DisplayObject;
      
      private var tf:TextFormat;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var bg:DisplayObject;
      
      private var scroll:FVScorllBar;
      
      private var goodsSpr:Sprite;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var grade:int;
      
      private var mainSkillContainer:Sprite;
      
      private var mainSkillItemFace:ItemFace;
      
      private var kuang1:Bitmap;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      private var isLockOn:Boolean = false;
      
      private var check:FCheckBox;
      
      private var checkFta:FTextArea;
      
      private var goodsId:int;
      
      private var gradeMcSpr:Sprite;
      
      private var ziMc:MovieClip;
      
      private var chengMc:MovieClip;
      
      private var title:FTextArea;
      
      private var quXiaoBtn:NewSkinButton;
      
      private var xianShiBtn:NewSkinButton;
      
      private var miaoShuSpr:Sprite;
      
      private var btnWeiYang:NewSkinButton;
      
      private var re73005:int = 0;
      
      public function FuWenDataPanel()
      {
         var bg:DisplayObject;
         super();
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/fuWenKeHua/rightBg.swf",function(param1:*, param2:*):*
         {
            param1.height = 368;
         });
         addChild(bg);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = 205;
         this.closeBtn.y = 3;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.title = new FTextArea();
         this.title.multiline = true;
         this.title.filters = StaticValue.filter;
         this.title.width = 100;
         this.title.height = 110;
         this.title.x = 75;
         this.title.y = 10;
         this.title.textColor = StaticValue.ORANGE;
         this.title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("符文") + "</font></textformat>";
         addChild(this.title);
         this.miaoShuSpr = new Sprite();
         this.miaoShuSpr.x = 20;
         this.miaoShuSpr.y = 45;
         this.miaoShuSpr.graphics.beginFill(0,0);
         this.miaoShuSpr.graphics.drawRect(0,0,230 - 12 - 20,200);
         this.miaoShuSpr.graphics.endFill();
         addChild(this.miaoShuSpr);
         this.scroll = new FVScorllBar(this.miaoShuSpr,200);
         addChild(this.scroll);
         this.scroll.x = 200;
         this.scroll.y = 45;
         this.miaoshu = new FTextArea();
         this.miaoShuSpr.addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.LEFT;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 230 - 50;
         this.miaoshu.htmlText = "";
         this.scroll.update();
         this.shuxing = new FTextArea();
         addChild(this.shuxing);
         this.shuxing.multiline = true;
         this.shuxing.autoSize = TextFieldAutoSize.LEFT;
         this.shuxing.wordWrap = true;
         this.shuxing.width = 230 - 12 - 20;
         this.shuxing.x = 20;
         this.shuxing.y = 120;
         this.shuxing.htmlText = "";
         this.goodsSpr = new Sprite();
         addChild(this.goodsSpr);
         this.gradeMcSpr = new Sprite();
         this.goodsSpr.addChild(this.gradeMcSpr);
         this.gradeMcSpr.mouseChildren = false;
         this.gradeMcSpr.mouseEnabled = false;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 95;
         this.mainSkillContainer.y = 280 - 10;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.xianShiBtn = new NewSkinButton();
         this.xianShiBtn.skin = "waiGuanXianShiButton";
         addChild(this.xianShiBtn);
         this.xianShiBtn.x = 40;
         this.xianShiBtn.y = 320;
         this.xianShiBtn.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.quXiaoBtn = new NewSkinButton();
         this.quXiaoBtn.skin = "quXiaoWaiGuanButton";
         addChild(this.quXiaoBtn);
         this.quXiaoBtn.visible = false;
         this.quXiaoBtn.x = 40;
         this.quXiaoBtn.y = 320;
         this.quXiaoBtn.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.btnWeiYang = new NewSkinButton();
         this.btnWeiYang.skin = "fwweiyangButton";
         addChild(this.btnWeiYang);
         this.btnWeiYang.visible = false;
         this.btnWeiYang.x = 40;
         this.btnWeiYang.y = 320;
         this.btnWeiYang.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         switch(param1.target)
         {
            case this.xianShiBtn:
               _loc2_ = false;
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[_loc2_,this.re73005]));
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_FUWENKEHUA_XIANSHIWAIGUAN_CLICK,"",[this.goodsId,1]));
               break;
            case this.quXiaoBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_FUWENKEHUA_XIANSHIWAIGUAN_CLICK,"",[this.goodsId,0]));
               break;
            case this.btnWeiYang:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[_loc2_,this.re73005]));
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_FUWENKEHUA_XIANSHIWAIGUAN_CLICK,"",[this.goodsId,1]));
         }
      }
      
      private function onSkillMouseDown(param1:MouseEvent) : void
      {
         if(this.isLockOn)
         {
            return;
         }
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_FUWENKEHUA_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         this._$parent.dispatchEvent(new BaseEvent(FuWenKeHua.UI_FUWENDATA_GUANBI_CLICK));
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Object = param1.target;
         switch(0)
         {
         }
      }
      
      public function setFuWenData(param1:Boolean, param2:int, param3:int, param4:String, param5:String, param6:int, param7:Boolean, param8:Boolean, param9:int = 0, param10:int = 0) : void
      {
         this.re73005 = param9;
         this.isLockOn = !param1;
         this.grade = param3;
         this.goodsId = param2;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param4 + "</font>";
         this.scroll.update();
         this.setAddStr(param5);
         this.setGoods(param2,param3);
         this.setSkill(param6);
         if(param7)
         {
            this.xianShiBtn.visible = !param8;
            this.quXiaoBtn.visible = param8;
            this.quXiaoBtn.enabled = param1;
            this.xianShiBtn.enabled = param1;
         }
         else
         {
            this.xianShiBtn.visible = false;
            this.quXiaoBtn.visible = false;
         }
         if(param10 == 0)
         {
            this.btnWeiYang.visible = false;
         }
         else if(param10 == 1)
         {
            this.btnWeiYang.visible = true;
         }
      }
      
      public function setAddStr(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc5_:String = null;
         var _loc6_:Array = null;
         var _loc2_:Array = param1.split(";");
         var _loc4_:int = int(_loc2_.length);
         _loc5_ = "<textformat leading=\'7\'>";
         _loc3_ = 0;
         while(_loc3_ < _loc4_ - 1)
         {
            _loc6_ = _loc2_[_loc3_].split(":");
            _loc5_ += ItemTip.fightAttr["a" + _loc6_[0]] + "  +" + _loc6_[1] + "<br>";
            _loc3_++;
         }
         _loc5_ += "</textformat>";
         this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'></font>";
      }
      
      private function setGoods(param1:int, param2:int) : void
      {
         var _loc3_:Goods = new Goods(param1);
         var _loc4_:String = StaticValue.WHITE_HTML;
         if(param2 == 1)
         {
            _loc4_ = StaticValue.GREEN_HTML;
         }
         else if(param2 == 2)
         {
            _loc4_ = StaticValue.PURPLE_HTML;
         }
         else if(param2 == 3)
         {
            _loc4_ = StaticValue.YELLOW_HTML;
         }
         this.title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + _loc4_ + "\'>" + _loc3_.res.name + "</font></textformat>";
      }
      
      public function setSkill(param1:int) : void
      {
         var _loc2_:Skill = null;
         var _loc3_:Bitmap = null;
         while(this.mainSkillContainer.numChildren > 0)
         {
            this.mainSkillContainer.removeChildAt(0);
         }
         if(this.mainSkillItemFace)
         {
            if(this.mainSkillItemFace.parent)
            {
               this.mainSkillItemFace.parent.removeChild(this.mainSkillItemFace);
            }
         }
         if(param1 > 0)
         {
            _loc2_ = new Skill(param1);
            _loc2_.isLearn = 1;
            _loc3_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc3_.x = -2;
            _loc3_.y = -2;
            this.mainSkillContainer.addChild(_loc3_);
            this.mainSkillItemFace = new ItemFace(_loc2_);
            this.mainSkillItemFace.showKungFuTag();
            this.mainSkillItemFace.setShowCount(false);
            this.mainSkillContainer.addChild(this.mainSkillItemFace);
         }
      }
      
      private function onFuWenTips(param1:MouseEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc2_:ItemFace = param1.target as ItemFace;
         _loc3_ = _loc2_.name;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.onFuWenTips);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc4_ = StaticValue.WHITE_HTML;
               if(this.grade == 1)
               {
                  _loc4_ = StaticValue.GREEN_HTML;
               }
               else if(this.grade == 2)
               {
                  _loc4_ = StaticValue.PURPLE_HTML;
               }
               else if(this.grade == 3)
               {
                  _loc4_ = StaticValue.YELLOW_HTML;
               }
               _loc5_ = "<textformat leading=\'6\'>" + "<font color=\'" + _loc4_ + "\'>" + _loc3_ + "</font></textformat>";
               this.showTip(_loc5_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,this.onFuWenTips);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 5;
         this.tipCanvas.y = mouseY + 5;
      }
   }
}

