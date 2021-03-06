import Quick
import Nimble
import Clappr

class CoreFactoryTests: QuickSpec {
    
    override func spec() {
        describe("Core Factory") {
            context("Creation") {
                it("Should be able to create a core") {
                    let options = [kSourceUrl : "testUrl"]
                    let core = CoreFactory.create(options: options)
                    
                    expect(core).toNot(beNil())
                    expect(core.container).toNot(beNil())
                }
                
                it("Should be able to create container with plugins") {
                    let loader = Loader(externalPlugins: [FakeUICorePlugin.self])

                    let core = CoreFactory.create(loader)
                    
                    expect(core.hasPlugin(FakeUICorePlugin)).to(beTrue())
                }
            }
        }
    }
    
    class FakeUICorePlugin: UICorePlugin {
        override var pluginName: String {
            return "FakeCorePLugin"
        }
    }
}