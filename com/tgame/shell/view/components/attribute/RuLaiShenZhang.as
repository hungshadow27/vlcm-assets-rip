package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.rulaishenzhang.model.info.RuLaiShenZhangVO;
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
   
   public class RuLaiShenZhang extends Sprite
   {
      
      public static const UI_RULAISHENZHANG_GUANBI_CLICK:String = "UI_RULAISHENZHANG_GUANBI_CLICK";
      
      public var $parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var bgCanvas:FCanvas;
      
      private var fta:FTextArea;
      
      private var jn:FTextArea;
      
      private var ftaName:FTextArea;
      
      private var lingWuBtn:SmallButton;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fta5:FTextArea;
      
      private var fb1:FLabel;
      
      private var img:Bitmap;
      
      private var img2:Bitmap;
      
      private var item:ItemFace;
      
      private var gongImg:DisplayObject;
      
      private var ruLaiShenZhangTupoCanvas:RuLaiShenZhangTupoCanvas;
      
      public var tupoBo:Boolean = false;
      
      private var jianshuContainer:Sprite;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var fc1:FCanvas;
      
      private var fc2:FCanvas;
      
      private var isDrag:Boolean;
      
      public var bg:Bitmap;
      
      private var dqId:int;
      
      private var tf:TextFormat;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var tootips1:String = "";
      
      private var tarenBo:Boolean = true;
      
      private var gongImgObj:Object;
      
      private var bt_bit:Bitmap;
      
      private const MAX_ZHAOSHI_COUNT:int = 12;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var skillContainer:Sprite;
      
      private var loadUrl:String;
      
      private var gongMc:MovieClip;
      
      private var mcObj6:Object;
      
      public function RuLaiShenZhang()
      {
         var $mask:Sprite;
         this.gongImgObj = {};
         this.mcObj6 = {};
         super();
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
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 1;
         this.fc1.width = 403;
         this.fc1.height = 366;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 0 + 2;
         this.fc1.y = 1 + 2;
         this.fc1.width = 403 - 4;
         this.fc1.height = 212 + 11 - 2 + 35;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 0 + 2;
         this.fc1.y = 223 + 35;
         this.fc1.width = 403 - 4;
         this.fc1.height = 142 - 35;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.bt_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         this.bt_bit.x = 205;
         this.bt_bit.y = 225 + 35;
         this.bt_bit.width = 134 + 60;
         this.bt_bit.height = 138 - 35;
         addChild(this.bt_bit);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 140 + 5 - 5;
         this.previousButton.y = 195 - 5 + 35 + 7 + 4;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 235 - 5;
         this.nextButton.y = 195 - 5 + 35 + 7 + 4;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 220 + 55 - 67 + 15 - 8;
            y = 210 + 25 + 35 - 5;
            textColor = 1309028;
            htmlText = LanResManager.getLanCommonTextWords("属性加成：");
         }
         addChild(this.fta);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.ftaName = new FTextArea();
         with(this.ftaName)
         {
            filters = StaticValue.filter;
            x = 160;
            y = 195 - 5 + 35 + 7 + 4;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            width = 75;
            height = 16;
         }
         addChild(this.ftaName);
         this.lingWuBtn = new SmallButton();
         this.lingWuBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
         addChild(this.lingWuBtn);
         this.lingWuBtn.x = 335 - 23;
         this.lingWuBtn.y = 195 - 1 - 5 + 35 + 7 + 4;
         this.lingWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 220 + 55 - 67 + 15 - 8;
            y = 225 + 35 + 35 - 5 - 5;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta1);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            x = 5;
            y = 225 + 10 + 35 - 5;
            width = 206;
            height = 130;
            wordWrap = true;
         }
         addChild(this.fta2);
         this.jn = new FTextArea();
         this.jn.x = 340 - 5 + 5;
         this.jn.y = 310 - 23;
         this.jn.autoSize = TextFieldAutoSize.LEFT;
         this.jn.textColor = StaticValue.ORANGE;
         this.jn.filters = StaticValue.filter;
         this.jn.htmlText = LanResManager.getLanCommonTextWords("附带技能");
         addChild(this.jn);
         this.img2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img2);
         this.img2.x = 340 + 5;
         this.img2.y = 310;
         this.skillContainer = new Sprite();
         addChild(this.skillContainer);
         with(this.skillContainer)
         {
            x = 340 + 5 + 2;
            y = 312;
         }
         this.skillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.skillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.ruLaiShenZhangTupoCanvas = new RuLaiShenZhangTupoCanvas();
         addChild(this.ruLaiShenZhangTupoCanvas);
         this.ruLaiShenZhangTupoCanvas._parent2 = this;
         this.ruLaiShenZhangTupoCanvas.x = 138;
         this.ruLaiShenZhangTupoCanvas.y = -10;
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
         this.ruLaiShenZhangTupoCanvas.mask = $mask;
         addEventListener(UI_RULAISHENZHANG_GUANBI_CLICK,this.aa1);
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("如来神掌顶级激活（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击1000亿 防御800亿 血量2000亿 暴击28888 闪避 28888 所有武功提升100000层") + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.ruLaiShenZhangTupoCanvas._parent2 = param1;
         this.ruLaiShenZhangTupoCanvas._parent3 = this;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_RULAISHENZHANG_SHANGYIYE_CLICK));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_RULAISHENZHANG_XIAYIYE_CLICK));
               break;
            case this.lingWuBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.RULAISHENZHANG_LINGWU_SHOW));
               this.onShowLv(true);
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.skillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.skillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if(this.isDrag)
            {
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_RULAISHENZHANG_SKILL_DRAG,"",this.currSkill));
            }
            this.skillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.skillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      public function setInitialize(param1:Boolean, param2:RuLaiShenZhangVO) : void
      {
         this.setMainInitialize(param2.act,param2.def,param2.hp,param2.mp,param2.cp);
         this.setBowPage(param2.nowID,param2.nowLookingID);
         this.fta2.htmlText = "<textformat leading=\'5\'><font color=\'#e66a26\'>" + param2.miaoshu + "</font></textformat>";
         this.ftaName.htmlText = param2.nowLookingName;
         this.setSkill(param2.skill,param2.skill.isLearn == 1);
         this.setJiHuo(param1);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.RULAISHENZHANG_DINGJI_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.RULAISHENZHANG_DINGJI_ID];
         }
      }
      
      private function setMainInitialize(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:String = "";
         _loc6_ = _loc6_ + ("<textformat leading=\'2\'><font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>");
         _loc6_ = _loc6_ + (LanResManager.getLanCommonTextWords("攻击：+") + param1 + "<br>" + LanResManager.getLanCommonTextWords("防御：+") + param2 + "<br>" + LanResManager.getLanCommonTextWords("生命：+") + param3 + "<br>" + LanResManager.getLanCommonTextWords("内力：+") + param4 + "<br>" + LanResManager.getLanCommonTextWords("体力：+") + param5 + "<br>");
         _loc6_ = _loc6_ + "</font>";
         _loc6_ = _loc6_ + "</textformat>";
         this.fta1.htmlText = _loc6_;
      }
      
      private function setSkill(param1:Skill, param2:Boolean) : void
      {
         this.isDrag = param2;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.setShowCount(false);
         this.skillContainer.addChild(this.item);
         if(!param2)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.item.filters = [];
         }
      }
      
      private function setBowPage(param1:int, param2:int) : void
      {
         var int1:int = param1;
         var int2:int = param2;
         this.dqId = int2;
         this.loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/rulaishenzhang/" + int2 + ".swf";
         if(this.mcObj6[int2] != null)
         {
            if(Boolean(this.gongMc) && this.gongMc.parent != null)
            {
               this.gongMc.stop();
               this.gongMc.parent.removeChild(this.gongMc);
            }
            this.gongMc = this.mcObj6[int2];
            this.gongMc.play();
            this.gongMc.x = 3;
            this.gongMc.y = 5;
            addChildAt(this.gongMc,0);
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
               if(Boolean(gongMc) && gongMc.parent != null)
               {
                  gongMc.stop();
                  gongMc.parent.removeChild(gongMc);
               }
               gongMc = _loc2_.content as MovieClip;
               mcObj6[int2] = gongMc;
               if(gongMc)
               {
                  gongMc.play();
                  gongMc.x = 3;
                  gongMc.y = 5;
                  addChildAt(gongMc,0);
               }
            },null,false,this.loadUrl);
         }
         if(int2 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(int2 == this.MAX_ZHAOSHI_COUNT)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         int2--;
         if(int1 > int2 && int2 >= 0)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            this.lingWuBtn.enabled = false;
         }
         else if(int1 == int2)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
            this.lingWuBtn.enabled = true;
         }
         else
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.lingWuBtn.enabled = false;
         }
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.ruLaiShenZhangTupoCanvas.x == 138)
            {
               TweenMax.to(this.ruLaiShenZhangTupoCanvas,1,{"x":410});
               this.tupoBo = true;
            }
            this.lingWuBtn.enabled = false;
            this.previousButton.enabled = false;
            this.nextButton.enabled = false;
         }
         else
         {
            if(this.ruLaiShenZhangTupoCanvas.x == 410)
            {
               TweenMax.to(this.ruLaiShenZhangTupoCanvas,1,{"x":138});
               this.tupoBo = false;
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_RULAISHENZHANG_ZIDONGTISHENG_CLICKJ,"",false));
            }
            if(this.lingWuBtn.label == LanResManager.getLanCommonTextWords("开始领悟"))
            {
               this.lingWuBtn.enabled = true;
            }
            this.ruLaiShenZhangTupoCanvas.check.selectState = false;
            this.ruLaiShenZhangTupoCanvas.check.enabled = true;
            this.ruLaiShenZhangTupoCanvas.zdlwBtn.enabled = true;
            if(this.dqId == 1)
            {
               this.previousButton.enabled = false;
            }
            else
            {
               this.previousButton.enabled = true;
            }
            if(this.dqId == this.MAX_ZHAOSHI_COUNT)
            {
               this.nextButton.enabled = false;
            }
            else
            {
               this.nextButton.enabled = true;
            }
         }
      }
      
      public function isRulaishenzhangtupoCanvasShow() : Boolean
      {
         if(this.ruLaiShenZhangTupoCanvas.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setRulaishenzhangTupoInitialize(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.ruLaiShenZhangTupoCanvas.setInitialize(param2,param3,param4,param5,param6,param7,param1);
      }
      
      public function setRulaishenzhangLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.ruLaiShenZhangTupoCanvas.setZhufuzhi(param1,param2,param3);
      }
      
      public function setRulaishenzhangLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.ruLaiShenZhangTupoCanvas.setGoods(param1,param2);
      }
      
      public function setRulaishenzhangLingwuBtn(param1:Boolean) : void
      {
         this.ruLaiShenZhangTupoCanvas.setBtn(param1);
      }
      
      public function setRulaishenzhangEnabledFun() : void
      {
         this.lingWuBtn.enabled = this.lingWuBtn.visible = false;
         this.previousButton.enabled = this.previousButton.visible = false;
         this.nextButton.enabled = this.nextButton.visible = false;
         this.tarenBo = false;
      }
   }
}

