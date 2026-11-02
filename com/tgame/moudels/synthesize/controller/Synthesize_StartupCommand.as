package com.tgame.moudels.synthesize.controller
{
   import com.tgame.moudels.synthesize.model.Synthesize_MsgReceiveProxy;
   import com.tgame.moudels.synthesize.model.Synthesize_MsgSendProxy;
   import com.tgame.moudels.synthesize.view.HuXinYaoTiShengMediator;
   import com.tgame.moudels.synthesize.view.HuYILingHuaMediator;
   import com.tgame.moudels.synthesize.view.HuYIUpdataMediator;
   import com.tgame.moudels.synthesize.view.HuYIXiLianMediator;
   import com.tgame.moudels.synthesize.view.HushenfuXilianMediator;
   import com.tgame.moudels.synthesize.view.LongyaKaiguangMediator;
   import com.tgame.moudels.synthesize.view.LongyinUpdateMediator;
   import com.tgame.moudels.synthesize.view.ShiShiKaiFengMediator;
   import com.tgame.moudels.synthesize.view.UI_MainCharSynthesizeMediator;
   import com.tgame.moudels.synthesize.view.UI_MainCharequipUpdataTypePanelMediator;
   import com.tgame.moudels.synthesize.view.XunZhangHeChengMediator;
   import com.tgame.moudels.synthesize.view.ZhuangbeiJihuoMediator;
   import com.tgame.moudels.xunzhangduanzao.model.XunZhangDuanZao_MsgSenderProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Synthesize_StartupCommand extends SimpleCommand
   {
      
      public function Synthesize_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Synthesize_MsgSendProxy());
         facade.registerProxy(new Synthesize_MsgReceiveProxy());
         facade.registerProxy(new XunZhangDuanZao_MsgSenderProxy());
         facade.registerMediator(new UI_MainCharSynthesizeMediator());
         facade.registerMediator(new UI_MainCharequipUpdataTypePanelMediator());
         facade.registerMediator(new HuYIUpdataMediator());
         facade.registerMediator(new HuYILingHuaMediator());
         facade.registerMediator(new HuYIXiLianMediator());
         facade.registerMediator(new LongyinUpdateMediator());
         facade.registerMediator(new ZhuangbeiJihuoMediator());
         facade.registerMediator(new LongyaKaiguangMediator());
         facade.registerMediator(new HushenfuXilianMediator());
         facade.registerMediator(new ShiShiKaiFengMediator());
         facade.registerMediator(new HuXinYaoTiShengMediator());
         facade.registerMediator(new XunZhangHeChengMediator());
      }
   }
}

