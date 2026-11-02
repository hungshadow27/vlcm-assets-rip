package com.tgame.shell.view.components.party
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FAlertEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.moudels.partyTask.model.info.BiaoCheInfo;
   import com.tgame.shell.view.components.Party_taskPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.*;
   
   public class Party_task_GerenYunbiaoPanel extends Sprite
   {
      
      public var type:int;
      
      public var _parent:DisplayObject;
      
      private var fta:FTextArea;
      
      private var biaocheSwf:MovieClip;
      
      private var biaocheFTA:FTextArea;
      
      private var btnPath:SecondButton;
      
      private var loadUrl:String;
      
      private var biaocheUrl:String = "/res/data/mc/biaoche/yunbiao/";
      
      private var textBiaoChe:FLabel;
      
      private var selectGradeBiaoChe:FTextArea;
      
      private var listContainerBiaoChe:FCanvas;
      
      private var selectListBiaoChe:FList;
      
      private var selectBtnBiaoChe:FSimpleButton;
      
      private var textZhongdian:FLabel;
      
      private var selectGradeZhongdian:FTextArea;
      
      private var listContainerZhongdian:FCanvas;
      
      private var selectListZhongdian:FList;
      
      private var selectBtnZhongdian:FSimpleButton;
      
      private var lblCondition:FLabel;
      
      private var ftaCondCont:FTextArea;
      
      private var lblGuerdon:FLabel;
      
      private var ftaGuerCont:FTextArea;
      
      private var btnTo:SecondButton;
      
      private var btnAccept:SecondButton;
      
      private var btnExplain:SecondButton;
      
      public var bgImg:Bitmap;
      
      private var goodsArr:Array = [];
      
      public var compFlag:int = 0;
      
      private var goodsBg:Sprite;
      
      private var goodsTx:Bitmap;
      
      private var rOffX:int = 384;
      
      private var rOffY:int = 58;
      
      private var _hpTotal:int = 0;
      
      private var _hpPerSec:int = 0;
      
      private var _speed:int = 0;
      
      private var _expPunish:int = 0;
      
      private var _grade:int = 50;
      
      private var _copper:int = 0;
      
      private var _expBanghui:int = 0;
      
      private var _expGeren:int = 0;
      
      private var _exp:int = 0;
      
      private var _zhenqi:int = 0;
      
      private var _copperPrise:int = 0;
      
      private var dataArr:Array = [];
      
      public var pathPanel:Party_task_PathPanel;
      
      public function Party_task_GerenYunbiaoPanel()
      {
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.party.task.yunbiao.ui";
         addChild(this.bgImg);
         this.setUI();
      }
      
      public function setUI() : void
      {
         this.textBiaoChe = new FLabel();
         this.selectGradeBiaoChe = new FTextArea();
         this.listContainerBiaoChe = new FCanvas();
         this.selectListBiaoChe = new FList();
         this.textZhongdian = new FLabel();
         this.selectGradeZhongdian = new FTextArea();
         this.listContainerZhongdian = new FCanvas();
         this.selectListZhongdian = new FList();
         this.goodsBg = new Sprite();
         this.goodsBg.x = 340;
         this.goodsBg.y = 188;
         addChild(this.goodsBg);
         this.initBiaocheInfo();
         this.initRightPanel();
         this.initList(209,1,this.textBiaoChe,this.selectGradeBiaoChe,this.listContainerBiaoChe,this.selectListBiaoChe,this.selectBtnBiaoChe,LanResManager.getLanCommonTextWords("请选择镖车") + "：",LanResManager.getLanCommonTextWords("请选择镖车"),[],1);
         this.initList(209,25,this.textZhongdian,this.selectGradeZhongdian,this.listContainerZhongdian,this.selectListZhongdian,this.selectBtnZhongdian,LanResManager.getLanCommonTextWords("请选择运镖的终点") + "：",LanResManager.getLanCommonTextWords("请选择运镖的终点"),[],2);
         if(this.compFlag == 2)
         {
            this.btnAccept.enabled = false;
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function initBiaocheInfo() : void
      {
         var _loc1_:String = null;
         _loc1_ = "<textformat leading=\'0.1\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("镖车属性：") + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("生命值：") + this._hpTotal + "  " + LanResManager.getLanCommonTextWords("每分钟恢复：") + this._hpPerSec + "  " + LanResManager.getLanCommonTextWords("移动速度：") + this._speed + " </font><br>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("镖车被劫惩罚：") + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("1、镖车被打爆扣除押镖个人帮会贡献值：") + this._expPunish + LanResManager.getLanCommonTextWords("点") + "<br>" + LanResManager.getLanCommonTextWords("2、镖车被打爆扣除押镖人提交的押镖保证金") + "<br>" + LanResManager.getLanCommonTextWords("3、镖车被打爆扣除押镖人所在帮会帮贡仓库中的一") + "</font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("(注：的卢马以下的镖车，打爆后不获得任何奖励)") + "</font>" + "</textformat>";
         this.biaocheFTA = new FTextArea();
         this.biaocheFTA.x = 3;
         this.biaocheFTA.y = 163;
         this.biaocheFTA.width = 350;
         this.biaocheFTA.height = 135;
         this.biaocheFTA.htmlText = _loc1_;
         this.biaocheFTA.filters = StaticValue.filter;
         addChild(this.biaocheFTA);
      }
      
      public function initRightPanel() : void
      {
         var cont1:String = LanResManager.getLanCommonTextWords("人物等级") + this._grade + LanResManager.getLanCommonTextWords("级以上；") + "<br>" + LanResManager.getLanCommonTextWords("个人背包铜币：") + this._copper + "<br>" + LanResManager.getLanCommonTextWords("个人帮会贡献：") + this._expBanghui;
         var cont2:String = LanResManager.getLanCommonTextWords("个人帮会贡献：") + this._expGeren + "<br>" + LanResManager.getLanCommonTextWords("经验：") + this._exp + "  " + LanResManager.getLanCommonTextWords("真气：") + this._zhenqi + "  " + LanResManager.getLanCommonTextWords("铜币：") + this._copperPrise + "<br>" + LanResManager.getLanCommonTextWords("选取一件商城道具奖励");
         this.btnPath = new SecondButton();
         this.btnPath.label = LanResManager.getLanCommonTextWords("镖车路线查看");
         addChild(this.btnPath);
         this.btnPath.x = 167 + this.rOffX;
         this.btnPath.y = -29 + this.rOffY;
         this.btnPath.addEventListener(MouseEvent.CLICK,this.onPathClick);
         this.lblCondition = new FLabel();
         with(this.lblCondition)
         {
            x = -65 + rOffX;
            y = 0 + rOffY;
            width = 100;
            height = 15;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("接取任务条件：");
         }
         addChild(this.lblCondition);
         this.ftaCondCont = new FTextArea();
         with(this.ftaCondCont)
         {
            x = -36 + rOffX;
            y = 15 + rOffY;
            width = 300;
            height = 65;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            htmlText = cont1;
         }
         addChild(this.ftaCondCont);
         this.lblGuerdon = new FLabel();
         with(this.lblGuerdon)
         {
            x = -65 + rOffX;
            y = ftaCondCont.y + ftaCondCont.height - 16;
            width = 100;
            height = 15;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("完成任务奖励：");
         }
         addChild(this.lblGuerdon);
         this.ftaGuerCont = new FTextArea();
         with(this.ftaGuerCont)
         {
            x = -36 + rOffX;
            y = lblGuerdon.y + lblGuerdon.height - 6;
            width = 300;
            height = 60;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            htmlText = cont2;
         }
         addChild(this.ftaGuerCont);
         this.btnTo = new SecondButton();
         with(this.btnTo)
         {
            x = -224 + rOffX;
            y = 230 + rOffY;
            label = LanResManager.getLanCommonTextWords("前往镖局");
            addEventListener(MouseEvent.CLICK,onToClick);
         }
         addChild(this.btnTo);
         this.btnAccept = new SecondButton();
         with(this.btnAccept)
         {
            x = -88 + rOffX;
            y = 230 + rOffY;
            label = LanResManager.getLanCommonTextWords("领取运镖任务");
            addEventListener(MouseEvent.CLICK,onAcceptClick);
         }
         addChild(this.btnAccept);
         this.btnExplain = new SecondButton();
         with(this.btnExplain)
         {
            x = 66 + rOffX;
            y = 230 + rOffY;
            label = LanResManager.getLanCommonTextWords("运镖说明");
            addEventListener(MouseEvent.CLICK,onExplainClick);
         }
         addChild(this.btnExplain);
      }
      
      private function showSelectList(param1:FCanvas) : Function
      {
         var listContainer:FCanvas = param1;
         var fun:Function = function(param1:MouseEvent):void
         {
            listContainer.visible = !listContainer.visible;
            if(listContainer.visible)
            {
               setChildIndex(listContainer,numChildren - 1);
            }
         };
         return fun;
      }
      
      private function onPathClick(param1:MouseEvent) : void
      {
         if(!this.pathPanel)
         {
            this.pathPanel = new Party_task_PathPanel();
            this.pathPanel.$parent = this;
         }
         if(this.selectListZhongdian == null || this.selectListZhongdian.selectItem == null)
         {
            return;
         }
         this.pathPanel.setPath(int(OtherConst.huBiaoLineId.indexOf(int(this.selectListZhongdian.selectItem.id)) + 1));
         this.pathPanel.visible = true;
         this.pathPanel.x = (GameConfig.sceneWidth - this.pathPanel.width) / 2;
         this.pathPanel.y = (GameConfig.sceneHeight - this.pathPanel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.pathPanel);
      }
      
      private function onListSelect(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.selectListBiaoChe:
               if(this.selectListBiaoChe.selectItem.label != null)
               {
                  this.selectGradeBiaoChe.text = this.selectListBiaoChe.selectItem.label;
                  this.listContainerBiaoChe.visible = false;
                  this.setSwf(int(this.selectListBiaoChe.selectItem.bcID));
                  this.initDataDetails();
               }
               break;
            case this.selectListZhongdian:
               if(this.selectListZhongdian.selectItem.label != null)
               {
                  this.selectGradeZhongdian.text = this.selectListZhongdian.selectItem.label;
                  this.listContainerZhongdian.visible = false;
               }
         }
      }
      
      private function onToClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYTASK_TOBIAOQJU_CLICK));
         if(this._parent.parent)
         {
            this._parent.parent.removeChild(this._parent);
         }
      }
      
      private function onAcceptClick(param1:MouseEvent) : void
      {
         if(this.selectListBiaoChe.selectItem != null && this.selectListZhongdian.selectItem != null)
         {
            this._parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYTASK_GERENJIEQURENWU_CLICK,"",[this.type,(this.selectListBiaoChe.selectItem as BiaoCheInfo).bcID,this.selectListZhongdian.selectItem.id]));
         }
      }
      
      private function onExplainClick(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         var str:String = "<font color=\'" + StaticValue.GOLD_HTML + "\'>" + LanResManager.getLanCommonTextWords("运镖注意事项：") + "</font>" + "<br>" + LanResManager.getLanCommonTextWords("在运镖过程中请小心来自其他玩家的袭击，") + "<br>" + LanResManager.getLanCommonTextWords("如果在到达终点前镖车被打爆，同样会被认为运镖失败。") + "<br>" + LanResManager.getLanCommonTextWords("运镖失败并不会退还接镖时的费用，运镖有风险请小心。") + "<br>" + "<font color=\'" + StaticValue.GOLD_HTML + "\'>" + LanResManager.getLanCommonTextWords("劫镖规则：") + "</font>" + "<br>" + LanResManager.getLanCommonTextWords("1、角色的等级大于等于50级才可以劫镖。") + "<br>" + LanResManager.getLanCommonTextWords("2、只能劫杀的卢马以上的镖车才会获得奖励。") + "<br>" + LanResManager.getLanCommonTextWords("3、每个玩家每天只能劫5次镖车。");
         FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
         FAlert.show(str,"",1,function(param1:FAlertEvent):void
         {
         });
      }
      
      private function initDataDetails() : void
      {
         var _loc1_:BiaoCheInfo = this.selectListBiaoChe.selectItem as BiaoCheInfo;
         if(_loc1_ != null)
         {
            this.setBiaocheInfo(_loc1_.bcHP,_loc1_.bcHuiFu,_loc1_.bcSpeed,_loc1_.bcChenFa);
            this.selectGradeBiaoChe.text = _loc1_.label;
            this.setDataZD1(_loc1_.line);
            this.setRightPanel([_loc1_.taskLv,_loc1_.taskCopper,_loc1_.taskGongXian,_loc1_.taskJLGongXian,_loc1_.taskJLExp,_loc1_.taskJLZhenQi,_loc1_.taskJLCopper]);
            this.initGoodsList(_loc1_.taskJLItem);
            this.setSwf(_loc1_.bcID - 1);
         }
      }
      
      private function setSwf(param1:int) : void
      {
         var swfIndex:int = param1;
         if(this.loadUrl == GameConfig.fileBaseFolder + this.biaocheUrl + (swfIndex + 1) + ".swf" && Boolean(this.biaocheSwf))
         {
            if(Boolean(this.biaocheSwf) && this.biaocheSwf.parent != null)
            {
               this.biaocheSwf.stop();
               this.biaocheSwf.parent.removeChild(this.biaocheSwf);
            }
            this.biaocheSwf.x = 146 - this.biaocheSwf.width * 0.5;
            this.biaocheSwf.y = 88 - this.biaocheSwf.height * 0.5;
            addChild(this.biaocheSwf);
            this.biaocheSwf.play();
            return;
         }
         if(swfIndex >= 9)
         {
            return;
         }
         this.loadUrl = GameConfig.fileBaseFolder + this.biaocheUrl + "0.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            if(Boolean(biaocheSwf) && biaocheSwf.parent != null)
            {
               biaocheSwf.stop();
               biaocheSwf.parent.removeChild(biaocheSwf);
            }
            biaocheSwf = _loc2_.content as MovieClip;
            if(biaocheSwf)
            {
               biaocheSwf.x = 146 - biaocheSwf.width * 0.5;
               biaocheSwf.y = 88 - biaocheSwf.height * 0.5;
               addChild(biaocheSwf);
            }
         },null,false,this.loadUrl);
      }
      
      private function setBiaocheInfo(param1:int, param2:int, param3:int, param4:int) : void
      {
         this._hpTotal = param1;
         this._hpPerSec = param2;
         this._speed = param3;
         this._expPunish = param4;
         var _loc5_:String = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("镖车属性：") + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("生命值：") + this._hpTotal + "  " + LanResManager.getLanCommonTextWords("每分钟恢复：") + this._hpPerSec + "  " + LanResManager.getLanCommonTextWords("移动速度：") + this._speed + " </font><br>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("镖车被劫惩罚：") + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("1、镖车被打爆扣除押镖个人帮会贡献值：") + this._expPunish + LanResManager.getLanCommonTextWords("点") + "<br>" + LanResManager.getLanCommonTextWords("2、镖车被打爆扣除押镖人提交的押镖保证金") + "<br>" + LanResManager.getLanCommonTextWords("3、镖车被打爆扣除押镖人所在帮会帮贡仓库中的一") + "</font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("(注：的卢马以下的镖车，打爆后不获得任何奖励)") + "</font>" + "</textformat>";
         this.biaocheFTA.htmlText = _loc5_;
      }
      
      private function setRightPanel(param1:Array) : void
      {
         var _loc2_:String = null;
         this._grade = param1[0];
         this._copper = param1[1];
         this._expBanghui = param1[2];
         this._expGeren = param1[3];
         this._exp = param1[4];
         this._zhenqi = param1[5];
         this._copperPrise = param1[6];
         switch(this.type)
         {
            case -1:
               _loc2_ = LanResManager.getLanCommonTextWords("个人背包铜币") + "：";
               break;
            case -2:
               _loc2_ = LanResManager.getLanCommonTextWords("帮贡铜钱存量") + "：";
         }
         var _loc3_:String = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("人物等级") + this._grade + LanResManager.getLanCommonTextWords("级以上；") + "<br>" + _loc2_ + this._copper + "<br>" + LanResManager.getLanCommonTextWords("个人帮会贡献：") + this._expBanghui + "</textformat>";
         var _loc4_:String = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("个人帮会贡献：") + this._expGeren + "<br>" + LanResManager.getLanCommonTextWords("经验：") + this._exp + "  " + LanResManager.getLanCommonTextWords("真气：") + this._zhenqi + "  " + LanResManager.getLanCommonTextWords("铜币：") + this._copperPrise + "<br>" + LanResManager.getLanCommonTextWords("选取一件商城道具奖励") + "</textformat>";
         this.ftaCondCont.htmlText = _loc3_;
         this.ftaGuerCont.htmlText = _loc4_;
      }
      
      private function initList(param1:int, param2:int, param3:FLabel, param4:FTextArea, param5:FCanvas, param6:FList, param7:FSimpleButton, param8:String, param9:String, param10:Array, param11:int = 1) : void
      {
         var offsetX:int = param1;
         var offsetY:int = param2;
         var text:FLabel = param3;
         var selectGrade:FTextArea = param4;
         var listContainer:FCanvas = param5;
         var selectList:FList = param6;
         var selectBtn:FSimpleButton = param7;
         var txt1:String = param8;
         var txt2:String = param9;
         var data:Array = param10;
         var type:int = param11;
         with(text)
         {
            x = 80 + offsetX;
            y = 6 + offsetY;
            width = 110;
            height = 25;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = txt1;
         }
         addChild(text);
         with(selectGrade)
         {
            x = 213 + offsetX;
            y = 5 + offsetY;
            width = 130;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = txt2;
         }
         addChild(selectGrade);
         listContainer.skin = "backGroud";
         listContainer.x = 211 + offsetX;
         listContainer.y = 22 + offsetY;
         addChild(listContainer);
         listContainer.visible = false;
         selectBtn = new FSimpleButton();
         selectBtn.skin = "bottomButton";
         addChild(selectBtn);
         selectBtn.x = 317 + offsetX;
         selectBtn.y = 5 + offsetY;
         selectBtn.addEventListener(MouseEvent.CLICK,this.showSelectList(listContainer));
         selectList.skin = "list";
         selectList.listWidth = 114;
         selectList.x = 5;
         selectList.y = 2;
         if(type == 1)
         {
            selectList.itemRenderer = new BiaocheListRender();
         }
         else if(type == 2)
         {
            selectList.itemRenderer = new BiaocheZhongdianListRender();
         }
         selectList.dataProvider = data;
         listContainer.addChild(selectList);
         selectList.addEventListener(MouseEvent.CLICK,this.onListSelect);
         listContainer.width = selectList.width + 10;
         listContainer.height = selectList.height + 4;
      }
      
      private function initGoodsList(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ItemFace = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(this.goodsBg.numChildren)
         {
            this.goodsBg.removeChildAt(0);
         }
         if(param1 != null && param1.length > 0)
         {
            _loc2_ = int(param1.length);
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc5_ = _loc4_ % 6;
               _loc6_ = _loc4_ / 6;
               _loc3_ = new ItemFace(param1[_loc4_] as Goods);
               _loc3_.name = _loc4_.toString();
               this.goodsBg.addChild(_loc3_);
               _loc3_.x = _loc5_ * 47 + 2;
               _loc3_.y = _loc6_ * 45 + 2;
               _loc4_++;
            }
         }
      }
      
      private function setDataBC1(param1:Array) : void
      {
         this.selectListBiaoChe.dataProvider = param1;
         this.listContainerBiaoChe.height = 20 * param1.length + 5;
      }
      
      private function setDataZD1(param1:Array) : void
      {
         this.selectListZhongdian.dataProvider = param1;
         this.selectListZhongdian.setSelectItemByIndex(0);
         this.selectGradeZhongdian.text = this.selectListZhongdian.selectItem.label;
         this.listContainerZhongdian.height = 20 * param1.length + 5;
      }
      
      public function removeSwf() : void
      {
         if(Boolean(this.biaocheSwf) && this.biaocheSwf.parent != null)
         {
            this.biaocheSwf.stop();
            this.biaocheSwf.parent.removeChild(this.biaocheSwf);
         }
      }
      
      public function initData(param1:Array) : void
      {
         this.removeSwf();
         this.selectListBiaoChe.dataProvider = param1;
         this.selectListBiaoChe.itemRenderer = new BiaocheListRender();
         this.selectListBiaoChe.setSelectItemByIndex(0);
         this.listContainerBiaoChe.height = 20 * param1.length + 5;
         this.initDataDetails();
      }
   }
}

