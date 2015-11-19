import Foundation

public class MediaControl: UIBaseObject {
    @IBOutlet weak var seekBarView: UIView!
    @IBOutlet weak var bufferBarView: UIView!
    @IBOutlet weak var progressBarView: UIView!
    @IBOutlet weak var scrubberView: ScrubberView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var scrubberLabel: UILabel!
    @IBOutlet weak var bufferBarWidthContraint: NSLayoutConstraint!
    @IBOutlet weak var scrubberLeftConstraint: NSLayoutConstraint!

    @IBOutlet weak public var controlsOverlayView: GradientView!
    @IBOutlet weak public var controlsWrapperView: UIView!
    @IBOutlet weak public var playPauseButton: UIButton!
    
    public internal(set) var container: Container!

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public class func initWithContainer(container: Container) -> MediaControl {
        let nib = UINib(nibName: "MediaControlView", bundle: NSBundle(forClass: MediaControl.self))
        let mediaControl = nib.instantiateWithOwner(self, options: nil).last as! MediaControl
        mediaControl.container = container
        return mediaControl
    }
    
    public func hide() {
        setSubviewsVisibility(hidden: true)
    }
    
    public func show() {
        setSubviewsVisibility(hidden: false)
    }
    
    private func setSubviewsVisibility(hidden hidden: Bool) {
        for subview in subviews {
            subview.hidden = hidden
        }
    }

    @IBAction func togglePlay(sender: UIButton) {
        play()
    }
    
    private func play() {
        playPauseButton.selected = true
        container.play()
        
    }
    
}