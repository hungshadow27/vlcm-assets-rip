package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.qingdieshuangren.model.info.QingDieShuangRenVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenMax;
   
   public class QingDieShuangRenPanel extends Sprite
   {
      
      public static const UI_QINGDIESHUANGREN_GUANBI_CLICK:String = "UI_QINGDIESHUANGREN_GUANBI_CLICK";
      
      public var _parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      public var bg:DisplayObject;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var titleFta:FTextArea;
      
      private var miaoshuTitleFta:FTextArea;
      
      private var fta:FTextArea;
      
      private var ftaTotal:FTextArea;
      
      private var fta2:FTextArea;
      
      private var skillText:FTextArea;
      
      private var skillImg:Bitmap;
      
      private var item:ItemFace;
      
      private var xiuLianBtn:SmallButton;
      
      public var tupoBo:Boolean = false;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var dqcs:FTextArea;
      
      private var tf:TextFormat;
      
      private var tupoCanvas:QingDieShuangRenTupoCanvas;
      
      private var gongImg:DisplayObject;
      
      private var fc:FCanvas;
      
      private var gongImgObj:Object;
      
      private var nowID:int;
      
      private var yiLingWu:int = 0;
      
      private var mcId:int;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var checkWq:FCheckBox;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkill:Skill;
      
      private var kuang1:Bitmap;
      
      public function QingDieShuangRenPanel()
      {
         var $mask:Sprite;
         var fts:FTextArea = null;
         this.gongImgObj = {};
         super();
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shuanglongzhan/bg.swf");
         this.bg.x = 2;
         this.bg.y = 2;
         addChild(this.bg);
         this.fc = new FCanvas();
         this.fc.width = 403;
         this.fc.height = 366;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.mcObj = new Array();
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2;
         this.bloodMcSpr.y = 2;
         addChild(this.bloodMcSpr);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 135 + 35;
         this.previousButton.y = 222 + 90;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 255 + 35;
         this.nextButton.y = 222 + 90;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.dqcs = new FTextArea();
         with(this.dqcs)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 100;
            height = 16;
            x = 155 + 35;
            y = 222 + 90;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.dqcs);
         this.titleFta = new FTextArea();
         with(this.titleFta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 83;
            y = 244;
            textColor = StaticValue.ORANGE;
            htmlText = "<font size = \'15\'>" + LanResManager.getLanCommonTextWords("青蝶双刃") + "</font>";
         }
         this.miaoshuTitleFta = new FTextArea();
         with(this.miaoshuTitleFta)
         {
            filters = StaticValue.filter;
            width = 205;
            height = 100;
            wordWrap = true;
            x = 10;
            y = 265;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanCommonTextWords("青蝶双刃是「金蛇郎君」夏雪宜的独门武功，剑法共分6层，招式诡异多端，变幻难测，出手快若闪电，令人难以防御。江湖上人人闻其名而为之色变。");
         }
         this.ftaTotal = new FTextArea();
         with(this.ftaTotal)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 244 + 10;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("人物属性加成");
         }
         addChild(this.ftaTotal);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            x = 15;
            y = 285 - 10;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + "555555" + "<br>" + LanResManager.getLanCommonTextWords("防御：") + "213132" + "<br>" + LanResManager.getLanCommonTextWords("生命：") + "5456456" + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + "6464" + "<br>" + LanResManager.getLanCommonTextWords("闪避：") + "41646" + "</font><br>" + "</textformat>";
         }
         addChild(this.fta2);
         this.skillText = new FTextArea();
         with(this.skillText)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 333;
            y = 265;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("附带技能");
         }
         addChild(this.skillText);
         this.skillImg = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.skillImg);
         this.skillImg.x = 340;
         this.skillImg.y = 287;
         this.xiuLianBtn = new SmallButton();
         this.xiuLianBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
         addChild(this.xiuLianBtn);
         this.xiuLianBtn.x = 337;
         this.xiuLianBtn.y = 336;
         this.xiuLianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tupoCanvas = new QingDieShuangRenTupoCanvas();
         addChild(this.tupoCanvas);
         this.tupoCanvas._parent2 = this;
         this.tupoCanvas.x = 138;
         this.tupoCanvas.y = -10;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -10;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.tupoCanvas.mask = $mask;
         addEventListener(UI_QINGDIESHUANGREN_GUANBI_CLICK,this.aa1);
         fts = new FTextArea();
         fts.x = 10;
         fts.y = 7 + 80 + 20 + 15 + 20 + 20 + 20 + 20 + 25;
         fts.textColor = StaticValue.GREEN;
         fts.width = 120;
         fts.height = 20;
         fts.htmlText = LanResManager.getLanCommonTextWords("使用换装");
         addChild(fts);
         this.checkWq = new FCheckBox();
         addChild(this.checkWq);
         this.checkWq.x = 10 + 70;
         this.checkWq.y = 7 + 80 + 20 + 15 + 20 + 20 + 20 + 20 + 25;
         this.checkWq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.mainSkillContainer = new Sprite();
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
      }
      
      private function onSkillMouseDown(param1:MouseEvent) : void
      {
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
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SHENZHAOJING_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkWq:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUXINGBAOJIA_HUANZHUANG_CLICK,"",[2,45458,this.checkWq.selectState]));
         }
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this.tupoCanvas._parent2 = param1;
         this.tupoCanvas._parent3 = this;
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QINGDIESHUANGREN_PREVIOUS_CLICK));
               break;
            case this.nextButton:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QINGDIESHUANGREN_NEXT_CLICK));
               break;
            case this.xiuLianBtn:
               if(this.tupoBo)
               {
                  return;
               }
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QINGDIESHUANGREN_XIULIAN_CLICK));
         }
      }
      
      public function initializateQingDieShuangRen(param1:QingDieShuangRenVO) : void
      {
         this.setBg(param1.nowLookingID);
         this.setZhaoShiMsg(param1.nowLookingName,param1.nowLookingID,param1.nowID + 1);
         this.setQingDieShuangRenShuxing(param1.act,param1.def,param1.hp,param1.baoJi,param1.shanBi);
         this.setSkill(param1.skill,param1.isCanUse);
         this.checkWq.selectState = param1.isHuanZHuang;
      }
      
      public function setBg(param1:int) : void
      {
         var loadUrl:String = null;
         var lookId:int = param1;
         this.mcId = lookId;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/shuanglongzhan/" + this.mcId + ".swf";
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         if(this.mcObj[this.mcId] != null)
         {
            this.bloodMc = this.mcObj[this.mcId];
            this.bloodMc.play();
            this.bloodMcSpr.addChild(this.bloodMc);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(bloodMc) && bloodMc.parent != null)
               {
                  bloodMc.stop();
                  bloodMc.parent.removeChild(bloodMc);
               }
               while(bloodMcSpr.numChildren > 0)
               {
                  bloodMcSpr.removeChildAt(0);
               }
               bloodMc = _loc2_.content as MovieClip;
               mcObj[mcId] = bloodMc;
               if(bloodMc)
               {
                  bloodMcSpr.addChild(bloodMc);
               }
            },null,false,loadUrl);
         }
      }
      
      private function setZhaoShiMsg(param1:String, param2:int, param3:int) : void
      {
         this.dqcs.htmlText = param1;
         this.nowID = param2;
         this.yiLingWu = param3;
         if(param2 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(param2 == 5)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         if(param2 == param3)
         {
            this.xiuLianBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
            this.xiuLianBtn.enabled = true;
         }
         else if(param2 < param3)
         {
            this.xiuLianBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            this.xiuLianBtn.enabled = false;
         }
         else
         {
            this.xiuLianBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.xiuLianBtn.enabled = false;
         }
      }
      
      private function setQingDieShuangRenShuxing(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:String = "";
         _loc6_ = "<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：+") + param1 + "<br>" + LanResManager.getLanCommonTextWords("防御：+") + param2 + "<br>" + LanResManager.getLanCommonTextWords("生命：+") + param3 + "<br>" + LanResManager.getLanCommonTextWords("暴击：+") + param4 + "<br>" + LanResManager.getLanCommonTextWords("闪避：+") + param5 + "<br>" + "</font></textformat>";
         this.fta2.htmlText = _loc6_;
      }
      
      private function setSkill(param1:Skill, param2:Boolean) : void
      {
         while(this.mainSkillContainer.numChildren > 0)
         {
            this.mainSkillContainer.removeChildAt(0);
         }
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         param1.isLearn = param2 ? 1 : 0;
         this.item = new ItemFace(param1);
         this.item.setShowCount(false);
         this.item.x = 342;
         this.item.y = 289;
         this.mainSkillContainer.addChild(this.item);
         if(param2)
         {
            this.item.filters = [];
         }
         else
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.tupoCanvas.x == 138)
            {
               TweenMax.to(this.tupoCanvas,1,{"x":410});
               this.tupoBo = true;
               this.xiuLianBtn.enabled = false;
               this.previousButton.enabled = false;
               this.nextButton.enabled = false;
            }
         }
         else if(this.tupoCanvas.x == 410)
         {
            TweenMax.to(this.tupoCanvas,1,{"x":138});
            this.tupoBo = false;
            this.xiuLianBtn.enabled = true;
            if(this.nowID == 1)
            {
               this.previousButton.enabled = false;
            }
            else
            {
               this.previousButton.enabled = true;
            }
            if(this.nowID == 18)
            {
               this.nextButton.enabled = false;
            }
            else
            {
               this.nextButton.enabled = true;
            }
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QINGDIESHUANGREN_ZIDONGTISHENG_CLICKJ,"",false));
         }
      }
      
      public function setInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.tupoCanvas.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.tupoCanvas.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.tupoCanvas.setGoods(param1,param2);
      }
      
      public function setShuoming(param1:String, param2:String) : void
      {
         this.tupoCanvas.setShuoming(param1,param2);
      }
      
      public function setBtn(param1:Boolean) : void
      {
         this.tupoCanvas.setBtn(param1);
      }
      
      public function setQingDieShuangRenEnabledFun() : void
      {
         this.xiuLianBtn.enabled = false;
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
      }
      
      public function isTuPoCanvasShow() : Boolean
      {
         if(this.tupoCanvas.x == 410)
         {
            return true;
         }
         return false;
      }
   }
}

