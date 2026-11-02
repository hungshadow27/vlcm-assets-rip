package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.xiakexing.model.info.XiaKeXingVO;
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
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class XiaKeXing extends Sprite
   {
      
      private var _$parent:DisplayObject;
      
      public const XIAKEXING_MAX:int = 7;
      
      private var bg:DisplayObject;
      
      private var bg1:DisplayObject;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var yanhuaMc:MovieClip;
      
      private var p:Point;
      
      private var kuang:Bitmap;
      
      private var mainSkill:Skill;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var lookingId:int = 0;
      
      private var nowId:int = 0;
      
      private var cengArr:Array = [];
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var qiuSpr:Sprite;
      
      private var qiuArrX:Array = [];
      
      private var qiuArrY:Array = [];
      
      private var qiu1:DisplayObject;
      
      private var qiu2:DisplayObject;
      
      private var qiu3:DisplayObject;
      
      private var qiu4:DisplayObject;
      
      private var qiu5:DisplayObject;
      
      private var qiu6:DisplayObject;
      
      private var qiu7:DisplayObject;
      
      private var qiu8:DisplayObject;
      
      public function XiaKeXing()
      {
         var _loc1_:FCanvas = null;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         _loc1_ = new FCanvas();
         _loc1_.skin = "box";
         addChild(_loc1_);
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 403;
         _loc1_.height = 366;
         _loc1_ = new FCanvas();
         _loc1_.skin = "box";
         _loc1_.x = 2;
         _loc1_.y = 231 + 32 - 25;
         _loc1_.width = 400;
         _loc1_.height = 135 - 32 + 25;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xiakexing/bg.swf");
         this.bg.x = 0;
         this.bg.y = 2;
         addChild(this.bg);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2;
         this.bloodMcSpr.y = 2;
         addChild(this.bloodMcSpr);
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 260;
         this.miaoshu.x = 23 - 11 + 20 - 15 - 6;
         this.miaoshu.y = 288 + 7 - 18 - 40 - 24;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("江湖绝技，使用后，可立即解除自身大部分减益状态。纵横江湖，自在逍遥，必备神技。") + "</font>";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 130;
         this.shuxing.height = 135;
         this.shuxing.x = 280;
         this.shuxing.y = 210 - 60 + 40 + 20 - 4;
         this.shuxing.textColor = StaticValue.GREEN;
         addChild(this.shuxing);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 250 + 78;
         this.tishengBtn.y = 300 + 38;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("开始闯岛");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 303 + 20 - 30 - 8 - 3;
         this.kuang.y = 298 + 20 + 6;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 325 - 30 - 8 - 3;
         this.mainSkillContainer.y = 300 + 20 + 6;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.mcObj = new Array();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.qiuSpr = new Sprite();
         this.qiuSpr.x = 0;
         this.qiuSpr.y = 0;
         addChild(this.qiuSpr);
         this.qiuArrX = new Array(233,192,156,135,101,68,29);
         this.qiuArrY = new Array(300,317,307,277,295,316,308);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XIAKEXING_KAISHITISHENG_CLICK));
         }
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XIAKEXING_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function showlihua() : void
      {
         if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            yanhuaMc = _loc2_.content as MovieClip;
            yanhuaMc.x = 52 + 15 - 124 + 81;
            yanhuaMc.y = 60 - 182 - 6 + 98 + 100;
            addChild(yanhuaMc);
         },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/xiakexing/long.swf");
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:XiaKeXingVO, param3:Array) : void
      {
         this.cengArr = param3;
         this.setBg(param2.nowID);
         this.setSkill(param2.skillid,param2.isLearn);
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param2.miaoshu + "</font>";
         this.shuxing.htmlText = "<textformat leading =\'2\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("属性增加：") + "<br>" + LanResManager.getLanCommonTextWords("攻击：") + param2.act + "<br>" + LanResManager.getLanCommonTextWords("防御：") + param2.def + "<br>" + LanResManager.getLanCommonTextWords("血量：") + param2.hp + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + param2.baoji + "<br>" + LanResManager.getLanCommonTextWords("闪避：") + param2.shanbi + "<br>" + LanResManager.getLanCommonTextWords("内力：") + param2.neili + "<br>" + LanResManager.getLanCommonTextWords("体力：") + param2.tili + "<br></font></textformat>";
         this.tishengBtn.enabled = param2.shengji;
      }
      
      public function setSkill(param1:int, param2:Boolean) : void
      {
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
         var _loc3_:Skill = new Skill(param1);
         this.mainSkill = _loc3_;
         if(param2)
         {
            this.mainSkill.isLearn = 1;
         }
         else
         {
            this.mainSkill.isLearn = 0;
         }
         this.mainSkillItemFace = new ItemFace(this.mainSkill);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
      }
      
      private function setBg(param1:int) : void
      {
         var i:int;
         var mcId:int = 0;
         var loadUrl:String = null;
         var id:int = param1;
         mcId = id;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/xiakexing/bg" + mcId + ".swf";
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         if(this.mcObj[mcId] != null)
         {
            this.bloodMc = this.mcObj[mcId];
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
         while(this.qiuSpr.numChildren > 0)
         {
            this.qiuSpr.removeChildAt(0);
         }
         i = 0;
         while(i < this.XIAKEXING_MAX)
         {
            this["qiu" + String(i + 1)] = null;
            if(i < id)
            {
               this["qiu" + String(i + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xiakexing/" + i + ".swf");
            }
            else
            {
               this["qiu" + String(i + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xiakexing/000.swf");
            }
            this["qiu" + String(i + 1)].name = i;
            this["qiu" + String(i + 1)].x = this.qiuArrX[i];
            this["qiu" + String(i + 1)].y = this.qiuArrY[i];
            this.qiuSpr.addChild(this["qiu" + String(i + 1)]);
            this.qiuSpr.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
            this.qiuSpr.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
            i++;
         }
      }
      
      private function onCheckTip(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         _loc2_ = int(param1.target.name);
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.qiuSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc3_ = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + this.cengArr[_loc2_].name + "<br>" + this.cengArr[_loc2_].nowExp + "/" + this.cengArr[_loc2_].maxExp + "<br>" + this.cengArr[_loc2_].tip + "</font>";
               this.showTip(_loc3_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.qiuSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
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
      
      public function setEnableFun() : void
      {
         this.tishengBtn.enabled = false;
      }
   }
}

