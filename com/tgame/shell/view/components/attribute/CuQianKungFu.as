package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.cuqiankungfu.model.info.CuQianKungFuVO;
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
   
   public class CuQianKungFu extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var bgCanvas:FCanvas;
      
      private var fta:FTextArea;
      
      private var jn:FTextArea;
      
      private var ftaName:FTextArea;
      
      private var barBar1:ColorBar;
      
      private var fireBarMC:MovieClip = null;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fb1:FLabel;
      
      private var img:Bitmap;
      
      private var img2:Bitmap;
      
      private var item:ItemFace;
      
      private var gongImg:DisplayObject;
      
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
      
      private var saodiBtn:NewSkinButton;
      
      private var xiakeBtn:NewSkinButton;
      
      private var zongshiBtn:NewSkinButton;
      
      private const MAX_ZHAOSHI_COUNT:int = 49;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var skillContainer:Sprite;
      
      private var loadUrl:String;
      
      private var gongMc:MovieClip;
      
      private var mcObj6:Object;
      
      private var confirmPanel:CuQianKungFuConfirmPanel;
      
      private var bNotShow:Boolean = false;
      
      private var feedBackPanel:CuQianKungFuFeedBackPanel;
      
      private var _type:int = -1;
      
      public function CuQianKungFu()
      {
         var bg:DisplayObject;
         var footText:FTextArea;
         this.gongImgObj = {};
         this.mcObj6 = {};
         super();
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/cuqiankungfu/ui.cuqiankungfu.bg.swf");
         bg.x = 0;
         bg.y = 0;
         addChild(bg);
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
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 140 + 5 - 5;
         this.previousButton.y = 95;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 235 - 5;
         this.nextButton.y = 95;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 15 - 10;
            y = 210 + 25 + 35 - 5 - 95 - 48;
            textColor = StaticValue.GREEN;
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
            y = 95 + 2;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            width = 75;
            height = 16;
         }
         addChild(this.ftaName);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 15 - 10;
            y = 185 - 48;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta1);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            x = 5 + 100;
            y = 225 + 10 + 35 - 5 - 100 - 50 + 7;
            width = 206;
            height = 130;
            wordWrap = true;
         }
         addChild(this.fta2);
         this.jn = new FTextArea();
         this.jn.x = 340 - 5 + 1;
         this.jn.y = 310 - 23 - 85 - 78;
         this.jn.autoSize = TextFieldAutoSize.LEFT;
         this.jn.textColor = StaticValue.ORANGE;
         this.jn.filters = StaticValue.filter;
         this.jn.htmlText = LanResManager.getLanCommonTextWords("附带技能");
         addChild(this.jn);
         this.skillContainer = new Sprite();
         addChild(this.skillContainer);
         with(this.skillContainer)
         {
            x = 340 + 5;
            y = 312 - 150 - 17;
         }
         this.barBar1 = new ColorBar(5,373 + 4,8);
         addChild(this.barBar1);
         this.barBar1.x = 15;
         this.barBar1.y = 215;
         this.saodiBtn = new NewSkinButton();
         this.saodiBtn.x = 15;
         this.saodiBtn.y = 270 - 44;
         this.saodiBtn.skin = "saodiButton";
         this.saodiBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("扫地的") + "<br>" + LanResManager.getLanCommonTextWords("隐藏的世外高人") + "<br>" + LanResManager.getLanCommonTextWords("挑战无需耗费元宝") + "<br>" + LanResManager.getLanCommonTextWords("每次挑战增加5点武学成长") + "<br>" + LanResManager.getLanCommonTextWords("每天挑战10次后，方可进行挑战。") + "</font>";
         this.saodiBtn.enabled = false;
         addChild(this.saodiBtn);
         this.saodiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.xiakeBtn = new NewSkinButton();
         this.xiakeBtn.x = 143;
         this.xiakeBtn.y = 270 - 44;
         this.xiakeBtn.skin = "xiakeButton";
         this.xiakeBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("侠客") + "<br>" + LanResManager.getLanCommonTextWords("主要的挑战对象") + "<br>" + LanResManager.getLanCommonTextWords("挑战时需要5元宝作为押金") + "<br>" + "Mỗi lần thách đấu tăng 1000 điểm trưởng thành." + "<br>" + LanResManager.getLanCommonTextWords("如果挑战成功，将获得金票作为挑战奖励。") + "</font>";
         addChild(this.xiakeBtn);
         this.xiakeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zongshiBtn = new NewSkinButton();
         this.zongshiBtn.x = 271;
         this.zongshiBtn.y = 270 - 44;
         this.zongshiBtn.skin = "zongshiButton";
         this.zongshiBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("宗师") + "<br>" + LanResManager.getLanCommonTextWords("真正的高手") + "<br>" + LanResManager.getLanCommonTextWords("挑战时需要消耗100元宝作为押金") + "<br>" + LanResManager.getLanCommonTextWords("每次挑战将增加100点武学成长。") + "<br>" + LanResManager.getLanCommonTextWords("挑战成功时，将获得大量金票奖励。") + "</font>";
         addChild(this.zongshiBtn);
         this.zongshiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("粗浅功夫顶级激活（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("粗浅功夫顶级激活（已激活）攻击1000亿 防御800亿 血量2000亿 暴击28888 闪避 28888 所有武功提升100000层") + "<br>";
            return _loc1_ + "</textformat>";
         });
         footText = new FTextArea();
         footText.filters = StaticValue.filter;
         footText.x = 5;
         footText.y = 330 - 12;
         footText.textColor = StaticValue.WHITE;
         footText.width = 390;
         footText.height = 60;
         footText.htmlText = LanResManager.getLanCommonTextWords("点击挑战人物，进行战斗修行，每次战斗需要元宝（非金票）作为押金。<br>每次挑战将获得武学成长值，成长值满时，武功提升层次。<br>挑战成功时，将获得大量金票奖励。");
         addChild(footText);
         this.fta3 = new FTextArea();
         with(this.fta3)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 315;
            y = 345;
            textColor = 1309028;
            htmlText = LanResManager.getLanCommonTextWords("剩余体力：");
         }
         addChild(this.fta3);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CUQIANKUNGFU_SHANGYIYE_CLICK));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CUQIANKUNGFU_XIAYIYE_CLICK));
               break;
            case this.saodiBtn:
               this.showConfirmPanel(0);
               break;
            case this.xiakeBtn:
               this.showConfirmPanel(1);
               break;
            case this.zongshiBtn:
               this.showConfirmPanel(2);
         }
      }
      
      public function setInitialize(param1:Boolean, param2:CuQianKungFuVO) : void
      {
         this.setMainInitialize(param2.act,param2.def,param2.hp,param2.bj,param2.sb);
         this.saodiBtn.enabled = param2.saodiValid;
         if(this._type == 0 && Boolean(this.feedBackPanel))
         {
            this.feedBackPanel.okBtn.enabled = param2.saodiValid;
         }
         this.setBowPage(param2.nowID,param2.nowLookingID);
         this.fta2.htmlText = "<textformat leading=\'0\'><font color=\'#e66a26\'>" + param2.miaoshu + "</font></textformat>";
         this.fta3.htmlText = LanResManager.getLanCommonTextWords("剩余体力：") + param2.tili;
         this.ftaName.htmlText = param2.nowLookingName;
         this.setSkill(param2.skill,param2.skill.isLearn == 1);
      }
      
      private function setMainInitialize(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:String = "";
         _loc6_ = _loc6_ + ("<textformat leading=\'0\'><font color=\'" + StaticValue.GREEN_HTML + "\'>");
         _loc6_ = _loc6_ + (LanResManager.getLanCommonTextWords("攻击：+") + param1 + "<br>" + LanResManager.getLanCommonTextWords("防御：+") + param2 + "<br>" + LanResManager.getLanCommonTextWords("生命：+") + param3 + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + "+" + param4 + "<br>" + LanResManager.getLanCommonTextWords("闪避：") + "+" + param5 + "<br>");
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
         this.dqId = param2;
         if(this.gongImg != null && this.gongImg.parent != null)
         {
            removeChild(this.gongImg);
         }
         var _loc3_:int = param2 / 7;
         if(this.gongImgObj[_loc3_] != null)
         {
            this.gongImg = this.gongImgObj[_loc3_];
         }
         else
         {
            this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/cuqiankungfu/" + _loc3_ + ".jpg",400,120);
            this.gongImgObj[_loc3_] = this.gongImg;
         }
         addChildAt(this.gongImg,1);
         if(param2 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(param2 == this.MAX_ZHAOSHI_COUNT)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
      }
      
      public function setJinduNum(param1:int, param2:int, param3:int, param4:Boolean) : *
      {
         if(param1 > param2)
         {
            this.barBar1.setValue(param2,param2);
         }
         else
         {
            this.barBar1.setValue(param1,param2);
         }
         this.showFireBar(param4);
      }
      
      private function showFireBar(param1:Boolean) : void
      {
         var b:Boolean = param1;
         if(b)
         {
            this.barBar1.type = 6;
            if(!this.fireBarMC)
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  fireBarMC = _loc2_.content as MovieClip;
                  fireBarMC.x = -11;
                  fireBarMC.y = 215 - 77;
                  fireBarMC.visible = true;
                  addChild(fireBarMC);
                  if(contains(fireBarMC))
                  {
                     setChildIndex(fireBarMC,6);
                  }
               },null,false,GameConfig.fileBaseFolder + "res/data/mc/qishangquan/firebar.swf");
            }
            if(Boolean(this.fireBarMC) && this.fireBarMC.parent != null)
            {
               this.fireBarMC.visible = true;
            }
         }
         else
         {
            this.barBar1.type = 5;
            if(Boolean(this.fireBarMC) && this.fireBarMC.parent != null)
            {
               this.fireBarMC.visible = false;
            }
         }
      }
      
      public function showConfirmPanel(param1:int) : void
      {
         var type:int = param1;
         this._type = type;
         if(this._type > 0 && Boolean(this.feedBackPanel))
         {
            this.feedBackPanel.okBtn.enabled = true;
         }
         if(this.bNotShow)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CUQIANKUNGFU_CHALLENGE_CLICK,"",this._type));
            return;
         }
         if(!this.confirmPanel)
         {
            this.confirmPanel = new CuQianKungFuConfirmPanel();
            this.confirmPanel.addEventListener(CuQianKungFuConfirmPanel.UI_CUQIANKUNGFU_CONFIRM_PANEL_ISSHOW,function(param1:BaseEvent):void
            {
               bNotShow = param1.data as Boolean;
            });
            this.confirmPanel.addEventListener(CuQianKungFuConfirmPanel.UI_CUQIANKUNGFU_CONFIRM_PANEL_OKBTN_CLICK,function(param1:BaseEvent):void
            {
               $parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CUQIANKUNGFU_CHALLENGE_CLICK,"",_type));
            });
         }
         GameInstance.uiInstance.uiContainer.addChild(this.confirmPanel);
         this.confirmPanel.x = (GameConfig.sceneWidth - this.confirmPanel.width) / 2;
         this.confirmPanel.y = (GameConfig.sceneHeight - this.confirmPanel.height) / 2;
      }
      
      public function showFeedBackPanel(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var strTitle:Array;
         var result:Boolean = param1;
         var type:int = param2;
         var yb:int = param3;
         var jp:int = param4;
         var cz:int = param5;
         var tl:int = param6;
         this._type = type;
         if(!this.feedBackPanel)
         {
            this.feedBackPanel = new CuQianKungFuFeedBackPanel();
            this.feedBackPanel.addEventListener(CuQianKungFuFeedBackPanel.UI_CUQIANKUNGFU_FEEDBACK_PANEL_RECHALLENGE_CLICK,function(param1:BaseEvent):void
            {
               feedBackPanel.onClose(null);
               showConfirmPanel(_type);
            });
         }
         strTitle = [LanResManager.getLanCommonTextWords("挑战扫地的"),LanResManager.getLanCommonTextWords("挑战侠客"),LanResManager.getLanCommonTextWords("挑战宗师")];
         this.feedBackPanel.titleText = strTitle[this._type];
         this.feedBackPanel.setDatas(result,yb,jp,cz,tl);
         GameInstance.uiInstance.uiContainer.addChild(this.feedBackPanel);
         this.feedBackPanel.x = (GameConfig.sceneWidth - this.feedBackPanel.width) / 2;
         this.feedBackPanel.y = (GameConfig.sceneHeight - this.feedBackPanel.height) / 2;
      }
      
      public function setCuQianKungFuEnabledFun() : void
      {
         this.previousButton.enabled = this.previousButton.visible = false;
         this.nextButton.enabled = this.nextButton.visible = false;
      }
   }
}

