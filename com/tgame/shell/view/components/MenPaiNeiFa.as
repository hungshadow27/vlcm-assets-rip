package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.menpaineifa.model.info.MenPaiNeiFaVo;
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
   
   public class MenPaiNeiFa extends FPanel
   {
      
      public static const UI_MENPAIJUEXUE:String = "UI_MENPAIJUEXUE";
      
      public static const UI_MENPAIJUEXUE_XIULIAN_CLICK:String = "UI_MENPAIJUEXUE_XIULIAN_CLICK";
      
      public static const UI_MENPAIJUEXUE_JINENG_CLICK:String = "UI_MENPAIJUEXUE_JINENG_CLICK";
      
      private var bg1:DisplayObject;
      
      private var jiangliBtn1:SecondButton;
      
      private var jiangliBtn:SecondButton;
      
      private var jiangliBtn3:SecondButton;
      
      private var jinziFt:FTextArea;
      
      private var countFt:FTextArea;
      
      private var shangchengBtn:SecondButton;
      
      private var txtMiaoShu:FTextArea;
      
      private var menpaiSpr:Sprite;
      
      private var menpaiBg:DisplayObject;
      
      private var xiulianBtn:NewSkinButton;
      
      private var menpaiBtn1:NewSkinButton;
      
      private var menpaiBtn2:NewSkinButton;
      
      private var menpaiBtn3:NewSkinButton;
      
      private var menpaiBtn4:NewSkinButton;
      
      private var menpaiBtn5:NewSkinButton;
      
      private var menpaiBtnSpr:Sprite;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var shuxing:FTextArea;
      
      private var tf:TextFormat;
      
      private var lookingId:int = 0;
      
      private var xingxingSpr:Sprite;
      
      private var p:Point;
      
      private var kuang:Bitmap;
      
      private var mainSkill:Skill;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var tipCanvas:FCanvas;
      
      private var tipSpr:Sprite;
      
      private var closeBtn233:FSimpleButton;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var item1:ItemFace;
      
      private var item2:ItemFace;
      
      private var item3:ItemFace;
      
      private var item4:ItemFace;
      
      private var item5:ItemFace;
      
      public function MenPaiNeiFa()
      {
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tipCanvas.x = 635;
         this.tipCanvas.width = 240;
         this.tipCanvas.height = 340;
         this.tipCanvas.visible = false;
         addChild(this.tipCanvas);
         this.tipSpr = new Sprite();
         addChild(this.tipSpr);
         this.tipCanvas.addChild(this.tipSpr);
         this.closeBtn233 = new FSimpleButton();
         this.closeBtn233.skin = "closeButton";
         this.tipCanvas.addChild(this.closeBtn233);
         this.closeBtn233.x = this.tipCanvas.width - this.closeBtn233.width - 2;
         this.closeBtn233.y = 2;
         this.closeBtn233.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tf = new TextFormat();
         this.tf.align = "center";
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 642 - 10 + 1;
         height = 408 - 30 - 1;
         this.titleText = "";
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/menpaijuexue/bg.swf");
         this.bg1.x = 12;
         this.bg1.y = 2;
         addChild(this.bg1);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/menpaijuexue/biaoti2.swf");
         this.bg1.x = 12 + 50;
         this.bg1.y = 2 - 110;
         addChild(this.bg1);
         this.jinziFt = new FTextArea();
         addChild(this.jinziFt);
         this.jinziFt.multiline = true;
         this.jinziFt.autoSize = TextFieldAutoSize.LEFT;
         this.jinziFt.wordWrap = true;
         this.jinziFt.width = 200;
         this.jinziFt.x = 20;
         this.jinziFt.y = 315 - 20;
         this.menpaiSpr = new Sprite();
         addChild(this.menpaiSpr);
         this.xingxingSpr = new Sprite();
         this.xingxingSpr.y = -60;
         addChild(this.xingxingSpr);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2 + 6 + 140;
         this.bloodMcSpr.y = 2 - 10 + 30;
         addChild(this.bloodMcSpr);
         this.mcObj = new Array();
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37 + 250;
         this.shangyiyeButton.y = 205 + 25 - 20 + 25 - 10 + 75;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 170 + 250;
         this.cengshu.y = 230 - 20 + 25 - 10 + 75;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16 + 250;
         this.xiayiyeButton.y = 205 + 25 - 20 + 25 - 10 + 75;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 100;
         this.shuxing.height = 150;
         this.shuxing.x = 210 + 13 + 17 + 135;
         this.shuxing.y = 250 + 20 - 3 - 200;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuang.x = 303 + 20;
         this.kuang.y = 298;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 225 + 15;
         this.mainSkillContainer.y = 300 - 205 + 15;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.xiulianBtn = new NewSkinButton();
         this.xiulianBtn.skin = "menpaijuexue_xiulian_Button";
         this.xiulianBtn.x = 480 - 460 + 195;
         this.xiulianBtn.y = 180 - 60 + 160;
         this.xiulianBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "修炼" + "</font>";
         addChild(this.xiulianBtn);
         this.xiulianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.menpaiBtnSpr = new Sprite();
         addChild(this.menpaiBtnSpr);
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
               PipeManager.sendMsg(PipeConstants.UI_MENPAINEIFA_SKILL_DRAG,this.currSkill);
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function setSkill(param1:int, param2:Boolean) : void
      {
         var _loc3_:Skill = null;
         while(this.mainSkillContainer.numChildren > 0)
         {
            this.mainSkillContainer.removeChildAt(0);
         }
         _loc3_ = new Skill(OtherConst.MENPAINEIFA_01);
         _loc3_.isLearn = 1;
         this.item1 = new ItemFace(_loc3_);
         this.item1.setShowCount(false);
         this.item1.x = -223;
         this.item1.y = -99;
         this.mainSkillContainer.addChild(this.item1);
         _loc3_ = new Skill(OtherConst.MENPAINEIFA_02);
         _loc3_.isLearn = 1;
         this.item2 = new ItemFace(_loc3_);
         this.item2.setShowCount(false);
         this.item2.x = -223 + 40;
         this.item2.y = -99;
         this.mainSkillContainer.addChild(this.item2);
         _loc3_ = new Skill(OtherConst.MENPAINEIFA_03);
         _loc3_.isLearn = 1;
         this.item3 = new ItemFace(_loc3_);
         this.item3.setShowCount(false);
         this.item3.x = -223 + 80;
         this.item3.y = -99;
         this.mainSkillContainer.addChild(this.item3);
         _loc3_ = new Skill(OtherConst.MENPAINEIFA_04);
         _loc3_.isLearn = 1;
         this.item4 = new ItemFace(_loc3_);
         this.item4.setShowCount(false);
         this.item4.x = -223 + 120;
         this.item4.y = -99;
         this.mainSkillContainer.addChild(this.item4);
         _loc3_ = new Skill(OtherConst.MENPAINEIFA_05);
         _loc3_.isLearn = 1;
         this.item5 = new ItemFace(_loc3_);
         this.item5.setShowCount(false);
         this.item5.x = -223 + 160;
         this.item5.y = -99;
         this.mainSkillContainer.addChild(this.item5);
         this.item1.visible = GameState.dictMainStatus[400796];
         this.item2.visible = GameState.dictMainStatus[400797];
         this.item3.visible = GameState.dictMainStatus[400798];
         this.item4.visible = GameState.dictMainStatus[400799];
         this.item5.visible = GameState.dictMainStatus[400800];
         if(this.mainSkillItemFace)
         {
            if(this.mainSkillItemFace.parent)
            {
               this.mainSkillItemFace.parent.removeChild(this.mainSkillItemFace);
            }
         }
         _loc3_ = new Skill(param1);
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
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         this.tipCanvas.visible = false;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.menpaiBtn1:
            case this.menpaiBtn2:
            case this.menpaiBtn3:
            case this.menpaiBtn4:
            case this.menpaiBtn5:
               dispatchEvent(new BaseEvent(UI_MENPAIJUEXUE_JINENG_CLICK,"",int(param1.currentTarget.name)));
               break;
            case this.xiulianBtn:
               dispatchEvent(new BaseEvent(UI_MENPAIJUEXUE_XIULIAN_CLICK));
               break;
            case this.shangyiyeButton:
               dispatchEvent(new BaseEvent(UI_MENPAIJUEXUE,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               dispatchEvent(new BaseEvent(UI_MENPAIJUEXUE,"",this.lookingId + 1));
               break;
            case this.closeBtn233:
               this.tipCanvas.visible = false;
         }
      }
      
      public function setPanel(param1:MenPaiNeiFaVo) : void
      {
         this.lookingId = param1.nowLookingID;
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + this.lookingId + "/5</font>";
         this.shuxing.htmlText = "<font size = \'16\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成") + "：<br>" + LanResManager.getLanCommonTextWords("攻击:") + param1.act + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param1.def + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param1.hp + "<br>" + LanResManager.getLanCommonTextWords("暴击:") + param1.baoji + "<br>" + LanResManager.getLanCommonTextWords("闪避:") + param1.shanbi + "</font>";
         var _loc2_:Goods = new Goods(param1.goods);
         this.jinziFt.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>可消耗" + _loc2_.res.name + "*" + param1.xiaohao + "进行修炼</font>";
         this.setBg(param1.menpai);
         this.setStar(param1.xingxing);
         this.setSkill(param1.skillid,param1.isLearn);
         this.setBtn(param1.menpai);
         if(this.lookingId <= 1)
         {
            this.shangyiyeButton.enabled = false;
         }
         else
         {
            this.shangyiyeButton.enabled = true;
         }
         if(this.lookingId >= 5)
         {
            this.xiayiyeButton.enabled = false;
         }
         else
         {
            this.xiayiyeButton.enabled = true;
         }
         if(this.lookingId < param1.nowID + 1)
         {
            this.xiulianBtn.enabled = false;
         }
         else if(this.lookingId == param1.nowID + 1)
         {
            this.xiulianBtn.enabled = true;
         }
         else if(this.lookingId > param1.nowID + 1)
         {
            this.xiulianBtn.enabled = false;
         }
      }
      
      private function setBtn(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 1;
         while(_loc3_ < 6)
         {
            if(_loc3_ != param1)
            {
               this["menpaiBtn" + _loc3_] = new NewSkinButton();
               this["menpaiBtn" + _loc3_].skin = this.setSkin(_loc3_);
               this["menpaiBtn" + _loc3_].name = String(_loc3_);
               this["menpaiBtn" + _loc3_].x = 550;
               this["menpaiBtn" + _loc3_].y = 20 + 80 * _loc2_;
               addChild(this["menpaiBtn" + _loc3_]);
               this["menpaiBtn" + _loc3_].addEventListener(MouseEvent.CLICK,this.onClick);
               _loc2_++;
            }
            _loc3_++;
         }
      }
      
      private function setSkin(param1:int) : String
      {
         switch(param1)
         {
            case 1:
               return "menpaijuexue_shaolin_Button";
            case 2:
               return "menpaijuexue_quanzhen_Button";
            case 3:
               return "menpaijuexue_gumu_Button";
            case 4:
               return "menpaijuexue_taohua_Button";
            case 5:
               return "menpaijuexue_baituo_Button";
            default:
               return "menpaijuexue_shaolin_Button";
         }
      }
      
      private function setBg(param1:int) : void
      {
         var bg2:DisplayObject;
         var mcId:int = 0;
         var loadUrl:String = null;
         var count:int = param1;
         while(this.menpaiSpr.numChildren > 0)
         {
            this.menpaiSpr.removeChildAt(0);
         }
         mcId = count;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/menpaijuexue/" + mcId + ".swf";
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
               bloodMc = _loc2_.content as MovieClip;
               mcObj[mcId] = bloodMc;
               if(bloodMc)
               {
                  bloodMcSpr.addChild(bloodMc);
               }
            },null,false,loadUrl);
         }
         bg2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/menpaijuexue/menpai" + count + ".swf");
         bg2.x = 40;
         bg2.y = 90;
         this.menpaiSpr.addChild(bg2);
      }
      
      private function setStar(param1:int) : void
      {
         var _loc3_:DisplayObject = null;
         while(this.xingxingSpr.numChildren > 0)
         {
            this.xingxingSpr.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < 10)
         {
            if(_loc2_ < param1)
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/menpaijuexue/liang.swf");
            }
            else
            {
               _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/menpaijuexue/an.swf");
            }
            _loc3_.x = _loc2_ * 40 + 40;
            _loc3_.y = 290;
            this.xingxingSpr.addChild(_loc3_);
            _loc2_++;
         }
      }
      
      public function setSkillPanel(param1:int, param2:int) : void
      {
         var mcId:int;
         var jineng:Skill;
         var itemf:ItemFace;
         var miaoshu:FTextArea;
         var bloodMc233:MovieClip = null;
         var loadUrl:String = null;
         var menpai:int = param1;
         var skillid:int = param2;
         this.tipCanvas.visible = true;
         while(this.tipSpr.numChildren > 0)
         {
            this.tipSpr.removeChildAt(0);
         }
         mcId = menpai;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/menpaijuexue/" + mcId + ".swf";
         if(Boolean(bloodMc233) && bloodMc233.parent != null)
         {
            bloodMc233.stop();
            bloodMc233.parent.removeChild(bloodMc233);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            bloodMc233 = _loc2_.content as MovieClip;
            if(bloodMc233)
            {
               bloodMc233.x = 10;
               bloodMc233.y = 10;
               tipSpr.addChildAt(bloodMc233,0);
            }
         },null,false,loadUrl);
         jineng = new Skill(skillid);
         jineng.isLearn = 1;
         itemf = new ItemFace(jineng);
         itemf.setShowCount(false);
         itemf.showKungFuTag();
         itemf.x = 70 + 15 + 15;
         itemf.y = 80 + 15;
         this.tipSpr.addChild(itemf);
         miaoshu = new FTextArea();
         miaoshu.multiline = true;
         miaoshu.filters = StaticValue.filter;
         miaoshu.width = 210;
         miaoshu.height = 135 + 40;
         miaoshu.wordWrap = true;
         miaoshu.x = 20;
         miaoshu.y = 200 - 40;
         miaoshu.textColor = StaticValue.ORANGE;
         miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + jineng.res.desc + "</font>";
         this.tipSpr.addChild(miaoshu);
      }
   }
}

