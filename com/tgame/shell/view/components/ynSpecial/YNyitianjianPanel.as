package com.tgame.shell.view.components.ynSpecial
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.asQuery.$;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import game.skin.YiTianJianSkin;
   import game.utils.SkinTools;
   
   public class YNyitianjianPanel extends BasePanel
   {
      
      public static const YTJ_JIHUO:String = "YTJ_JIHUO";
      
      private var sp:Sprite;
      
      private var sp1:Sprite;
      
      private var xyarr:Array = [new Point(301,76),new Point(375,96),new Point(429,151),new Point(449,225),new Point(429,299),new Point(374,353),new Point(301,373),new Point(226,354),new Point(172,299),new Point(152,225),new Point(171,150),new Point(226,96)];
      
      private var arrBit3:Array = ["00000","00001","00002","00003","00004","00005","00006","00007"];
      
      private var txt1:FTextArea;
      
      private var txt2:FTextArea;
      
      public function YNyitianjianPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YiTianJianSkin.skin,"yitianjian");
         this.sp1 = new Sprite();
         this.addChild(this.sp1);
         this.sp1.mouseChildren = this.sp1.mouseEnabled = false;
         this.sp1.x = 1;
         this.sp1.y = 29;
         this.sp = new Sprite();
         this.addChild(this.sp);
         this.init();
      }
      
      private function init() : void
      {
         var i:int;
         $("guanbi",this,true).click(function():*
         {
            onClose();
         });
         i = 1;
         while(i < 13)
         {
            $("anniu" + i,this,true).attr("visible",false);
            $("anniu" + i,this,true).click(this.onClick);
            $("anniu" + i,this,true).setIndexTop();
            i++;
         }
         $("jianjihuo",this,true).attr("visible",false);
         $("jianweijihuo",this,true).attr("visible",false);
         this.txt1 = new FTextArea();
         this.txt1.x = 15;
         this.txt1.y = 363;
         this.txt1.textColor = StaticValue.YELLOW;
         this.txt1.width = 300;
         this.txt1.height = 150;
         this.txt1.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "Thuộc Tính:" + "<br>" + "Tấn Công: 10.000.000.000" + "<br>" + "Phòng Thủ: 10.000.000.000" + "<br>" + "Bạo Kích: 100.000.000" + "<br>" + "Né Tránh: 100.000.000" + "<br>" + "Sinh Lực: 100.000.000.000" + "<br>" + "Kỹ Năng: Mỗi đòn đánh có khả năng phục hồi Nội Lực 3%" + "</font><br>";
         addChild(this.txt1);
         this.txt1.mouseEnabled = false;
         this.txt2 = new FTextArea();
         this.txt2.x = 475;
         this.txt2.y = 33;
         this.txt2.textColor = StaticValue.YELLOW;
         this.txt2.width = 160;
         this.txt2.height = 20;
         this.txt2.htmlText = new Goods(729432).res.name;
         addChild(this.txt2);
         ToolTips.createToolTips(this.txt2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("倚天神力描述1") + "<br>" + LanResManager.getLanCommonTextWords("倚天神力描述2") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("u");
         this.dispatchEvent(new BaseEvent(YTJ_JIHUO,null,int(_loc2_[1])));
      }
      
      public function upData(param1:Array, param2:int) : void
      {
         var _loc5_:Goods = null;
         var _loc6_:ItemFace = null;
         while(this.sp.numChildren > 0)
         {
            this.sp.removeChildAt(0);
         }
         while(this.sp1.numChildren > 0)
         {
            this.sp1.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc5_ = new Goods(param1[_loc3_].itemId);
            _loc6_ = new ItemFace(_loc5_);
            this.sp.addChild(_loc6_);
            _loc6_.x = this.xyarr[_loc3_].x;
            _loc6_.y = this.xyarr[_loc3_].y;
            _loc6_.filters = Tools.blackWhiteFilter;
            if(param1[_loc3_].isJihuo == 1)
            {
               $("anniu" + int(_loc3_ + 1),this,true).attr("visible",false);
            }
            else
            {
               $("anniu" + int(_loc3_ + 1),this,true).attr("visible",true);
            }
            if(param1[_loc3_].isJihuo == 1 && param1[_loc3_].isPeidai == 1)
            {
               this.setMC(_loc3_ + 1);
               _loc6_.filters = [];
            }
            _loc3_++;
         }
         var _loc4_:String = "";
         if(param2 == 0)
         {
            _loc4_ = "res/ui/UIditu/ynSpecial/ynYitianjian/wuqi/2.swf";
            this.txt1.textColor = StaticValue.HUISE;
         }
         else
         {
            _loc4_ = "res/ui/UIditu/ynSpecial/ynYitianjian/wuqi/1.swf";
            this.txt1.textColor = StaticValue.YELLOW;
         }
         this.setMC2(_loc4_);
         this.txt2.visible = GameState.dictMainStatus[729432];
      }
      
      private function setMC(param1:int) : void
      {
         var selectMc:MovieClip = null;
         var urlselect:String = null;
         var index:int = param1;
         selectMc = new MovieClip();
         urlselect = GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/ynYitianjian/y" + index + ".swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != urlselect)
            {
               return;
            }
            if(Boolean(selectMc) && selectMc.parent != null)
            {
               selectMc.stop();
               selectMc.parent.removeChild(selectMc);
            }
            selectMc = _loc2_.content as MovieClip;
            if(selectMc)
            {
               selectMc.x = 12;
               sp1.addChild(selectMc);
            }
         },null,false,urlselect);
      }
      
      private function setMC2(param1:String) : void
      {
         var selectMc:MovieClip = null;
         var urlselect:String = null;
         var str:String = param1;
         selectMc = new MovieClip();
         urlselect = GameConfig.fileBaseFolder + str;
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != urlselect)
            {
               return;
            }
            if(Boolean(selectMc) && selectMc.parent != null)
            {
               selectMc.stop();
               selectMc.parent.removeChild(selectMc);
            }
            selectMc = _loc2_.content as MovieClip;
            if(selectMc)
            {
               selectMc.x = 180;
               sp1.addChild(selectMc);
            }
         },null,false,urlselect);
      }
   }
}

