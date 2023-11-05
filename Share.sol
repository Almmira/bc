pragma solidity ^0.5.0;

contract Share {
    string public name = "Share";
    uint public fileCount = 0;
    mapping(uint => File) public files;

    struct File {
        uint fileId;
        string fileHash;
        string fileName;
        string fileDescription;
        uint uploadTime;
        address payable uploader;
    }

    event FileUploaded(
        uint fileId,
        string fileHash,
        string fileName,
        string fileDescription,
        uint uploadTime,
        address payable uploader
    );

    constructor() public {}

    function uploadFile(
        string memory _fileHash,
        string memory _fileName,
        string memory _fileDescription
    ) public {
        require(bytes(_fileHash).length > 0);
        require(bytes(_fileDescription).length > 0);
        require(bytes(_fileName).length > 0);
        require(msg.sender != address(0));

        fileCount++;

        files[fileCount] = File(
            fileCount,
            _fileHash,
            _fileName,
            _fileDescription,
            now,
            msg.sender
        );

        emit FileUploaded(
            fileCount,
            _fileHash,
            _fileName,
            _fileDescription,
            now,
            msg.sender
        );
    }
}
